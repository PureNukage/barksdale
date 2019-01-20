//turn off bank vars on the current bank object
o_controller.bank.array_abilities_colors[2] = false

//make the selected object the new bank
o_controller.bank = selection.id
selection.array_abilities_colors[2] = true

