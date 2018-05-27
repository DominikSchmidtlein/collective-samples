class SampleOrdersController < ApplicationController
  def show
    @sample_order = SampleOrder.find(params[:id])
  end

  def edit
    @sample_order = SampleOrder.find(params[:id])
    if @sample_order.pending?
      @samples = []

      shop = @sample_order.shop
      shop.supplier_partnerships.each do |partnership|
        supplier_id = partnership.supplier_id
        supplier_session = ShopifyApp::SessionRepository.retrieve(supplier_id)
        ShopifyAPI::Base.activate_session(supplier_session)

        @samples += partnership.samples.map do |sample|
          product = ShopifyAPI::Product.find(sample.shopify_product_id)
          {
            id: sample.id,
            title: product.title,
            img_src: product.image.src
          }
        end
      end
    else
      render status: 422, file: 'public/422.html'
    end
  end

  def update
    @sample_order = SampleOrder.find(params[:id])
    @sample_order.status = :submitted
    if @sample_order.update!(sample_order_params)
      shop_session = ShopifyApp::SessionRepository.retrieve(@sample_order.shop_id)
      ShopifyAPI::Base.activate_session(shop_session)

      order = ShopifyAPI::Order.find(@sample_order.shopify_order_id)
      order.attributes['note'] = Time.now.getutc.to_s
      order.save!

      redirect_to sample_order_path(@sample_order)
    else
      render status: 500, file: 'public/500.html'
    end
  end

  private

  def sample_order_params
    params.require(:sample_order).permit(sample_ids: [])
  end
end
