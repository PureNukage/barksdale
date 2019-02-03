var names = ds_list_create()

names[| 0] = "Sergey Nazarov"
names[| 1] = "Stringer Bell"
names[| 2] = "Jimmy McNulty"
names[| 3] = "Steve Ellis"
names[| 4] = "Walter White"

var whoami = irandom_range(0,ds_list_size(names)-1)

return (names[| whoami])