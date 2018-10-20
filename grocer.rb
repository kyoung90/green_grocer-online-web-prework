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
  counter = 0
  cart.each do |cart_item, cart_item_info|
    coupons.each do |discounts|
      if cart_item == discounts[:item] 
        while cart_item_info[:count] >= discounts[:num]
          cart_item_info[:count] -= discounts[:num]
          counter += 1
          hash["#{cart_item} W/COUPON"] = {:price => discounts[:cost], :clearance => cart_item_info[:clearance]}
          puts "cart #{cart}"
        end 
        puts "cart with coupon"
        puts cart
         hash["#{cart_item} W/COUPON"].merge!({:count => counter})
      end 
    end 
  end 
  cart.merge!(hash)
  return cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
