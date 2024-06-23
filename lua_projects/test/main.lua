::start::
io.write("Kolik rohlíků? ")
local x = tonumber(io.read())

if x == nil then
	print("Jsi kokot!")
	goto start
end

::middle::
io.write("Kolik zaplatíš? ")
local y = tonumber(io.read())

if y == nil then
	print("Jsi kokot!")
	goto middle
end

::ende::
if y < x * 3 then
	io.write("To nestačí, zaplať víc! Z = Znovu, C = Změnit cenu, E = Exit: ")
	local z = io.read()
	z = string.upper(z)
	if z == "Z" then
		goto start
	elseif z == "C" then
		goto middle
    elseif z == "E" then
        goto realend
	end
	print("Jsi kokot!")
	goto ende
end

print(x)
::realend::
