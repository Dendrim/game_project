local deg_to_radian_koeff = (1/180)*math.pi

-- class Vector initializer
Vector={}
Vector.__index=Vector
Vector.name="Vector"
--конструктор
function Vector.new(set_x, set_y)
  -- создаем пустую таблицу
  local vect1 = {}
  -- задаем тип таблицы
  setmetatable(vect1, Vector)

  -- ставим координаты
  vect1.x = set_x
  vect1.y = set_y
  return vect1
end
--операции с векторами
-- '+' overload

Vector.__add = function(vect1, vect2)
  return Vector.new((vect1.x + vect2.x), (vect1.y + vect2.y))
end
-- "-" overload
Vector.__sub = function(vect1, vect2)
  return Vector.new((vect1.x - vect2.x), (vect1.y - vect2.y))
end

function Vector:length()
  return (math.sqrt((self.x * self.x) + (self.y * self.y)))
end

-- УГОЛ ЗАДАЕМ В ГРАДУСАХ.
-- вращаем вектор вокруг точки (0, 0)
function Vector:rotate(theta_degree)
  local theta_radian=theta_degree*deg_to_radian_koeff
  local new_x= self.x * math.cos(theta_radian) - self.y * math.sin(theta_radian)
  local new_y= self.x * math.sin(theta_radian) + self.y * math.cos(theta_radian)
  return Vector.new(new_x, new_y)
end


-- УГОЛ ЗАДАЕМ В ГРАДУСАХ.
-- вращаем вектор вокруг точки "around"
function Vector:rotate_around(theta, around)
  local sub_x = self.x - around.x
  local sub_y = self.y - around.y
  local theta =  theta * deg_to_radian_koeff
  local new_x = sub_x * math.cos(theta) - sub_y * math.sin(theta) + around_x
  local new_y = sub_x * math.sin(theta) + sub_y * math.cos(theta) + around_y
  return Vector.new(new_x, new_y)
end


--преобразование в единичный вектор
function Vector:normalize()
  local length_supp_koefficient = 1 / self:length()
  local new_x = self.x * length_supp_koefficient
  local new_y = self.y * length_supp_koefficient
  return Vector.new(new_x, new_y)
end

--получаем перпендикулярный вектор
function Vector:get_normal()
  return Vector.new(self.y, -self.x)
end

--простое умножение вектора на число
function Vector:scale(coefficient)
  self.x=self.x*coefficient
  self.y=self.y*coefficient
end


-- ДАЛЕЕ ВСЕ БАЗИСЫ СОСТОЯТ ИЗ НОРМИРОВАННЫХ ВЕКТОРОВ
--
-- Получение координат вектора в другом базисе
function Vector:to_basis(vector, normal_vector)
  local new_x=self.x * normal_vector.x + self.y * vector.x
  local new_y=self.y * vector.y + self.x * normal_vector.y
  return Vector.new(new_x, new_y)
end

-- Получение координат вектора в другом базисе
--(то же , что и предыдущее, но результат в другом формате)
-- пока нихуя не возвращает, естественно
function Vector:to_basis_array_result(vector, normal_vector)
  local new_x=self.x*normal_vector.x+self.y*vector.x
  local new_y=self.y*vector.y+self.x*normal_vector.y
  return nil
end

-- из кастомного базиса в обычные(ортонормированные) координаты
function Vector:from_basis(vector, normal_vector)
  local new_x=(normal_vector.x*self.x)-(vector.x*self.y)
  local new_y=-(normal_vector.y*self.x)+(vector.y*self.y)
  return {1, 2}
end

print(type(Vector))
