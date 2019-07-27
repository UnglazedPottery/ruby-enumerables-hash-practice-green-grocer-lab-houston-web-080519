def consolidate_cart(cart)
  hashcart = {}
  cart.each do |item|
    name = item.keys[0]
    hashcart[name] = item.values[0]
    
    if hashcart[name][:count]
      hashcart[name][:count] += 1
    else
      hashcart[name][:count] = 1
    end
  end
  hashcart
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    if cart.keys.include? coupon[:item]
      if cart[coupon[:item]][:count] >= coupon[:num]
        item_w_coupon = "#{coupon[:item]} W/COUPON"
        if cart[item_w_coupon]
          cart[item_w_coupon][:count] += coupon[:num]
        else
        cart[item_w_coupon] = {
          price: coupon[:cost]/coupon[:num],
          clearance: cart[coupon[:item]][:clearance],
          count: coupon[:num]
          }
        end
        cart[coupon[:item]][:count] -= coupon[:num]
      end
    end
  end
  cart
end


def apply_clearance(cart)
  cart.each do |item|
    if cart[item][:clearance] == TRUE
      cart[item][:price] *= .80
    end
  end
end

def checkout(cart, coupons)
  
end
