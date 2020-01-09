require 'active_support/all'
def domdom(a)
	if a.present?
		p a
	else
		p "no"
	end
end
a = ""
domdom(a)
a = "yes"
domdom(a)
b = ""
b ? "i am" : "..."

