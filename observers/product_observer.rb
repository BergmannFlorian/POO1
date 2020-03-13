class ProductObserver < ActiveRecord::Observer

  def after_save(product)
    if product.stock < 5 
      p "mail send because #{product.name} product stock less than 5"
    end
  end
end