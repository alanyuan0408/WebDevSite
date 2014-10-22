module StaticPagesHelper
	def box(&block)
	  str = '<div class="box"><div class="boxContent">'      
	  str << capture(&block)
	  str << '</div></div>'
	  raw str
	end

	def odd_even(i)
		return " odd" if i.odd?
		return " even"
	end
end
