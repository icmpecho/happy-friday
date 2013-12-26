module DateHelper
	def next_friday (weeks=0)
		d = Date.today
		d = d + weeks * 7
		(d..(d+7)).find{|d| d.cwday == 5}
	end

	def last_friday
		d = Date.today
		((d-6)..d).find{|d| d.cwday == 5}
	end
	
end
