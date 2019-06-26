extends Node2D



func _process(delta):

	var X = $World/Player.position.x;

	
	$GUI/pos.text = str( round( X ) )

	if X > 128 && X < 560:
		$World.position.x = -X + 128
