require 'colorize'

def Sort(data,pass = 0,n = 0)
  i = 0
  a = 1
  k = 1
  s = data.length
  @pass = pass
  until a == s do
    @pass += 1
    x = data[i]
    if data[i+1]
      y = data[i+1]
      if TinySort(x,y) == true
        data[i] = y
        data[i+1] = x
        i += 1
      else
        data[i] = x
        data[i+1] = y
        i += 1
        a += 1
      end
      if a == s
        break
      end
    else
      # print "#{data}\n"
      Sort(data,@pass,n)
      break
    end
    if @pass == 0 || @pass == n
      @new_data = data
      data.each_with_index do |dat,index|
        if dat > 0
          @new_data[index] = 1
        else
          @new_data[index] = 0
        end
      end
      puts "Pass: #{@pass}\n"
      puts "#{@new_data}\n"
      n += k
      sleep 0.15
    end
  end
  return {data: data, passes: @pass}
end

def TinySort(x,y)
  if x > y
    return true
  elsif x <= y
    return false
  end
end

def ChooseRandomNumbers(array_size,min,max)
  array = []
  i = 0
  array_size.times do
    array[i] = rand(min..max)
    i += 1
  end
  # Colorize(array,2)
  return array
end

def Colorize(data,divisor = 2)
  min = data.min
  max = data.max
  midpoint = (max - min.abs())
  distance = (max + min.abs())
  fraction = distance/divisor

  iteration = 0
  position = min

  divisor.each do |color|
    
  end

  puts midpoint
  puts distance
  puts divisor
  puts fraction
  return fraction
end

def StartSorting(numbers_array)
  puts "\nStarting Array: #{numbers_array}\n\n"
  time = {}
  time[:start] = Time.new
  sorted_array = Sort(numbers_array)
  time[:end] = Time.new
  time_completed = (time[:Start].to_f - time[:end].to_f)
  performance_score = (sorted_array[:passes] / time_completed)/1000
  puts "\nSorted Array: #{sorted_array[:data]}"
  puts "Number of passes:  #{sorted_array[:passes]}"
  puts "Time completed:    #{time_completed} milliseconds"
  puts "Performance Score: #{performance_score}"
end

array_size = 25
min = -100
max = 100

random_numbers = ChooseRandomNumbers(array_size,min,max)

StartSorting(random_numbers)