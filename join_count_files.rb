def self.buildfile(majorFile,minorFile,sort,outputfile)

	mers1 = Hash.new()
	mers2 = Hash.new()
	comboHash = Hash.new()
	
	 File.foreach(majorFile) {|x| 
		xarr = x.split(",")
		mers1.store(xarr[0],xarr[1].to_i)
		}
	
	 File.foreach(minorFile) {|y| 
		yarr = y.split(",")
		mers2.store(yarr[0],yarr[1].to_i)
		}
		
	comboHash = mers1.merge(mers2){|key, oldval, newval| newval + oldval}
	
	if(sort == 'asc')
	open(outputfile, 'w') { |f|
		comboHash.sort{|a,b| a[1]<=>b[1]}.each { |elem|
		f.puts "#{elem[0]},#{elem[1]}"
			}
		}
	end
	if(sort == 'desc')
	open(outputfile, 'w') { |f|
		comboHash.sort{|a,b| b[1]<=>a[1]}.each { |elem|
		f.puts "#{elem[0]},#{elem[1]}"
			}
		}
	end
return 0
end
