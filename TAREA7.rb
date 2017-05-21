require "csv"
def factorial(n)
	i=1;
	acumulador=1
	while(i<=n)
		acumulador*=i
		i+=1
	end
	return acumulador
end
def combinatoria(n,m)
	if(n!=m && m!=0)
		return factorial(m)/(factorial(n)*factorial(m-n))
	else
		return 1
	end
end

def dinamicProgrammingCombinatoria(n,k)
	matriz = Array.new(k) { Array.new(k) }
	i=0
	while(i<k)
		matriz[i][i]=1
		i+=1
	end
	i=0
	j=0
	contador=0
	# print matriz
	while(i!=0 || j!=k)
		if(i>k||j>k)
			break
		end
		if(i>j)
			while(i<k)
				puts "#{i},#{j}"
				if(j==0)
					a=1
				elsif (j==1)
					puts "//#{i},#{j}"
					print matriz					
					a=matriz[i-1][j-1]
				else
					a=matriz[i-1][j-1]
				end
				b=matriz[i-1][j]

				matriz[i][j]=a+b
				i+=1
				j+=1
			end
			contador+=1
			j=0
			i=contador
		else
			i+=1
		end
	end
	CSV.open("combinatoria.csv", "w") do |csv|
 	i=0
 	while(i<k)
 		csv << matriz[i]
 		i+=1
 	end
	end
	puts "#{n}C#{k} = #{matriz[k-1][n-1]}"
end

# puts factorial(1)
# puts combinatoria(3,0)
# puts dinamicProgrammingCombinatoria(3,8)