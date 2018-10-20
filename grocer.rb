def consolidate_cart(cart)
  # code here
  new_hash = Hash.new(0)
  cart.each do |hash|
    hash.each do |cart_item, cart_item_info|
      if !new_hash.has_key?(cart_item)
        new_hash[cart_item] = cart_item_info.merge({:count => 1})
      else
        new_hash[cart_item][:count] += 1
      end 
    end 
  end 
  return new_hash
end

def apply_coupons(cart, coupons)
  # code here
  hash = Hash.new(0)

  cart.each do |cart_item, cart_item_info|
    coupons.each do |discounts|
      if cart_item == discounts[:item] 
        if cart_item_info[:count] >= discounts[:num]
          cart_item_info[:count] -= discounts[:num]
        end 
        if hash.has_key?("#{cart_item} W/COUPON")
          hash["#{cart_item} W/COUPON"][:count] += 1
        else
          hash["#{cart_item} W/COUPON"] = {:price => discounts[:cost], :clearance => cart_item_info[:clearance], :count => 1}
        end 
      end 
    end 
  end 
  cart.merge!(hash)
  return cart
end

def apply_clearance(cart)
  # code here
  puts cart
  cart.each do |cart_item, cart_item_info|
    if cart_item_info[:clearance]
      cart_item_info[:price] *= 0.80
      cart_item_info[:price] = cart_item_info[:price].round(2)
    end 
  end 
  return cart
end

def checkout(cart, coupons)
  # code here
  hash = consolidate_cart(cart)
  hash = apply_coupons(hash, coupons)
  hash = apply_clearance(hash) 
  
  total = 0 
  
  hash.each do |cart_item, cart_item_info|
    total += cart_item_info[:price]
  end 
  
  if total > 100
    total *= .90
    total = total.round(2)
  end 
  
  return total
end
