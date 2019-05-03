show "Assume this month 28 day start from 1st Monday\n".
show "I will eat mama every Sunday\n".
loop i -> (0,4,1)
show i.
 	show "month\n".
loop y -> (0,28,1)
  		cmp y%7 = 0 {
   			show "Day ".
   			show y.
   			show "Eat mama\n".
  		}.
fin.
fin.
