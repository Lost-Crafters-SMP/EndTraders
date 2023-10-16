# If it can not see sky, stop the loop
execute unless predicate endtraders:is_passthrough run scoreboard players set canSeeSky endtrader_math 0
execute unless predicate endtraders:is_passthrough run kill @s

# Continue loop until either hit height limit or hit block
execute unless score canSeeSky endtrader_math matches 0 if predicate endtraders:is_passthrough run tp @s ~ ~1 ~
execute unless score canSeeSky endtrader_math matches 0 if predicate endtraders:is_height_limit run kill @s
execute unless score canSeeSky endtrader_math matches 0 if predicate endtraders:is_passthrough unless predicate endtraders:is_height_limit at @s run function endtraders:can_see_sky/loop
