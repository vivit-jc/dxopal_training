require 'dxopal'
include DXOpal

x = 0                         # x座標の変数
y = 220                         # y座標の変数
count = 0
bullets = []

Window.load_resources do
  Window.bgcolor = C_BLACK
  img = Image.load("man.png")
  man = Sprite.new(x,y,img)
  enemy = Sprite.new(320,30,Image.new(20,20,C_WHITE))
  man.scale_x = 0.1
  man.scale_y = 0.1
  
  Window.loop do
    man.x += Input.x*2              # 横方向の入力でx座標を変更
    man.y += Input.y*2              # 縦方向の入力でy座標を変更
    count += 1
    if(count%20 == 0)
      bullets.push([Sprite.new(enemy.x,enemy.y,Image.new(5,5,C_WHITE),(enemy.y-man.y)/(enemy.x-man.x)])
    end
    bullets.each do |b|
      b[0].x += 3
      b[0].y += b[1]*3
      b[0].draw
    end
    
    man.draw
  end
end
