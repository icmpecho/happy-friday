module DateHelper
	def next_friday (weeks=0)
		d = Date.today
		d = d + weeks * 7
		(d..(d+7)).find{|d| d.cwday == 5}
	end
end
