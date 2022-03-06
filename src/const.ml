let fps = 60

let width = 300

let height = 300

let score = function
  | Graph2.Pellet -> 10
  | Graph2.PowerPellet -> 50
  | Graph2.Empty -> 0
  | Graph2.Wall -> 0

let powerpellet_buff = 5