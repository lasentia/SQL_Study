def solution(price, money, count):
    answer = -1
    total_price = 0
    
    for i in range(count):
        total_price += price * (i+1)
        
    answer = money - total_price
    
    if answer >= 0:
        return 0

    return answer * -1