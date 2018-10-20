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
  counter = 0
  cart.each do |cart_item, cart_item_info|
    coupons.each do |discounts|
      puts cart_item
      puts discounts[:item]
      if cart_item == discounts[:item] 
        puts "Made it into the while loop"
        while cart_item_info[:count] > discounts[:num]
          cart_item_info[:count] - discounts[:num]
          counter += 1
          cart["#{cart_item} W/COUPON"] = {:price => discounts[:cost], :clearance => cart_item_info[:clearance]}
        end 
        puts "cart with coupon"
        puts cart["#{cart_item} W/COUPON"]
         cart["#{cart_item} W/COUPON"].merge!({:count => counter})
      end 
    end 
  end 
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
