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
				# if(j==0)
				# 	# puts "as"
				# 	matriz[i][j]=1+matriz[i-1][j]
				# elsif(j==1)
				# 	puts " -->  #{i},#{j}"
				# 	puts "#{matriz[i-1][j-1]} + #{matriz[i-1][j]}"

				# 	matriz[i][j]=1+matriz[i-1][j]
				# else
				# 	# puts " >  #{i},#{j}"	
				# 	matriz[i][j]=matriz[i-1][j-1]+matriz[i-1][j]
				# end
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
				# matriz[i][j] = combinatoria(j+1,i+1)
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

	# puts matriz[k-1][n-1] + matriz[k-1][n]
	# print matriz
	puts "#{n}C#{k} = #{matriz[k-1][n-1]}"
end
# 	i=0
# 	j=1
# 	contador=0
# 	while(i!=0 || j!=29)
# 		if(j>i)
# 			while(j<30)
# 				a=matriz[i][j-1]
# 				b=matriz[j][j]
# 				matriz[i][j]=a+b
# 				j+=1
# 				i+=1
# 			end
# 			contador+=1
# 			i=0
# 			j=contador+1
# 		else
# 			j+=1
# 		end
# 	end

# 	matriz[0][29]=matriz[0][28]+matriz[29][29]
# 	CSV.open("apuestas.csv", "w") do |csv|
# 	 	i=0
# 	 	while(i<30)
# 	 		csv << matriz[i]
# 	 		i+=1
# 	 	end
#  	end
# 	diaInicial=0
# 	diaFinal=0
# 	i=0
# 	j=0
# 	max=matriz[0][0]
# 	while(i<30)
# 		j=0
# 		while(j<30)
# 			if(!matriz[i][j].nil? && matriz[i][j]>max)
# 				max=matriz[i][j]
# 				diaInicial=i+1
# 				diaFinal=j+1
# 			end
# 			j+=1
# 		end
# 		i+=1
# 	end
# 	puts "*************DYNAMIC PROGRAMMING*********************"
# 	puts "La ganancia máxima es: #{max}"
# 	puts "Jugando desde el día #{diaInicial} hasta #{diaFinal}"
# 	puts "*****************************************************"
# end

puts factorial(1)
puts combinatoria(3,0)
puts dinamicProgrammingCombinatoria(3,8)
	# apuestas=[29,-7,14,21,30,-47,1,7,-39,23,-20,-36,0,27,-34,7,48,35,-46,-16,32,18,5,-33,27,28,-22,1,-20,-42]
	# backtrackingApuestas(apuestas,0,0,[],[],0)
	# dinamicProgrammingApuestas(apuestas)