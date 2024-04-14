---
layout: post
title: "Brilliant Young Programmers"
excerpt: 
date: 2021-02-10 22:22:33 -0600
categories:
 - minecraft
---

Last summer, [when we were forced to move our Minecraft U camps online]({{site.url}}/2020/12/26/2020-year-in-review-part-2/), it allowed us to reach beyond our Dallas borders.

> By being remote, we were able to have campers from all over the country. In fact, our star camper from this year lives in California.

That star camper burned through all our [curriculum](https://github.com/MinecraftU/mcu-curriculum) in record time, and we were forced to develop new challenges for him every week. I put our former star camper---now in high school and one of our lead instructors---on the job.

After the summer we briefly lost touch with this camper, so I emailed his dad---himself an engineer---inquiring about what kind of additional programming instruction they might be interested in. We settled on informal two-hour sessions every weekend. We've been working on various projects on our ComputerCraft server, and lately both said camper and said instructor have been blowing my mind with the code they're writing.

----

The first amazing piece of code was for a mod I was only just being introduced to. [The mod](https://ngcm.github.io/PythonTool-Mod/) allows you to write Python code to modify the Minecraft environment. This application---written by an 11-year-old entirely on his own---creates random parkour at various difficulty levels, including checkpoints. This is just a taste:

{% highlight python %}
# Parkour Course Generation
mc.setBlock(pos.x,pos.y-1,pos.z, block.GOLD_BLOCK.id)
for i in range(25):
  # Parkour Generation Variables
  rng = random.randint(0,50)
  offsetz = 0
  offsety = 0
  dis = random.randint(2,3)
  if difficulty > 0:
    dis = random.randint(3,4)
    if difficulty > 1:
      offsetz = random.randint(0,1)
      offsety = random.randint(0,1)
  
  # Parkour Jump Distance
  pos.x += dis
  
  # The More Difficulty, the More Special Jumps
  def jumprng(chance):
    if rng < 12-chance:
      mc.setBlock(pos.x, pos.y-1 + offsety, pos.z + offsetz, block.GOLD_BLOCK.id)
      specialjump = 0
    elif 10 <= rng <= 10+chance and difficulty > 2:
      skeppy(dis)
      specialjump = 1
    elif 11+chance <= rng <= 11+2*chance and difficulty > 2:
      headhitter(dis)
      specialjump = 1
    elif 12+2*chance <= rng <= 12+2*chance+round(chance/2) and difficulty > 4:
      neo(dis)
      specialjump = 1
    elif 13+2*chance+round(chance/2) <= rng <= 12+2*chance+2*(round(chance/2)) and difficulty > 4:
      corner()
      specialjump = 1
    else:
      mc.setBlock(pos.x, pos.y-1 + offsety, pos.z + offsetz, block.STONE.id)
      specialjump = 0
{% endhighlight %}

[Full file here](https://github.com/MinecraftU/PythonTool-Scripts/blob/main/RandomParkour.py).

----

![]({{site.url}}/assets/2021/02/2021-01-23_17.08.52.png "ComputerCraft computer with attached printer and our very first printout")

The last few weeks we've been exploring the printer functionality in ComputerCraft. While printers are a thing and there is an API to print to them, there are no built-in programs to actually turn text into a printed page. For example, any call to print to the page just prints a single line and extra characters beyond the width of that line are not printed. So we had to write our own printing program to print multiple lines, then multiple pages. Again, I'm including just a portion of the program:

{% highlight lua %}
--- loads input string into an array where each element of the array is one word
local tWords = mysplit(sCopyToPrint)

local iLineLengthCounter = 0
local sLineText = ""
local iLineCount = 1

--- print a page
for i=1,21,1 do
  --- create a new page
  p.newPage()
  --- reset line count
  iLineCount = 1
  --- print each line
  for i, v in ipairs(tWords) do
    --- how long will the current line be if we add this string to it?
    iLineLengthCounter = iLineLengthCounter + string.len(v) + 1
    --- if under 25 chars, we're safe to continue the current line
    if iLineLengthCounter < 25 then
      sLineText = sLineText .. v .. " "
    --- else, print the current line and add this string to the next line
    else
      p.write(sLineText)
      --- put current word on next line
      sLineText = v .. " "
      --- increment the line counter
      iLineLengthCounter = string.len(v) + 1
      --- set cursor on next line
      iLineCount = iLineCount + 1
      p.setCursorPos(1, iLineCount)
    end
  end
  --- this will print the page out
  p.endPage()
end
{% endhighlight %}

[Full file here](https://github.com/MinecraftU/mcu-curriculum/blob/master/level_4/example_turtle_programs/printer.lua).

----

Finally, that instructor I mentioned has spent the last number of weeks programming a turtle---the ComputerCraft computers that can move around and interact with their environment like robots---to take a copy of one 3D area of Minecraft and duplicate it. This was a particularly large piece of Lua code. I had a hard time picking a chunk with which to demonstrate its complexity:

{% highlight lua %}
function scan(i)
  if turtle.detect() then
    local success, data = turtle.inspect()
    table.insert(blocks, data.name)
    print("inserted " .. blocks[i])
  else
    print("inserted air")
    table.insert(blocks, "air")
  end
end

--- find specified item in inventory and select that slot
function selItem(item)
  local done = false
  turtle.select(1)
  for slot = 1, 16 do
    if done then
      done = false
      return true
    end
    if turtle.getItemCount(slot) > 0 then
      slotData = turtle.getItemDetail(slot)
      if slotData.name == item then
        turtle.select(slot)
        print("attempting to select" .. item)
        done = true
      end
    end
  end
end

---inspect, log, and dig each block of one row
function scanRow()
  for i = 1, length do
    scan(i)
    turtle.dig()
    turtle.forward()
  end
end

---scanRow() and then reverse to replace each block of one row according to the saved list
function copyRow()
  scanRow()
  turtle.back()
  placeRow()
  turtle.forward()
  turtle.turnRight()
  turtle.forward()
  turtle.turnLeft()
  table.insert(rows, blocks)
  blocks = {}
end

--- place a row of blocks according to a saved list
function placeRow()
  for i = length, 1, -1 do
    if blocks[i] == "air" then
      print("leaving air gap")
      turtle.back()
    else
      selItem(blocks[i])
      sleep(0.1)
      print("placing" .. blocks[i])
      turtle.place()
      turtle.back()
    end
  end
end

--- paste in each row of current plane
function pasteArea()
  for i = 1, width do
    for i = 1, length do
      turtle.forward()
    end
    blocks = rows[i]
    placeRow()
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
  end
end
{% endhighlight %}

You can see the turtle in action here:

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/cwpG1ANpxk0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

And the [full file is here](https://github.com/MinecraftU/mcu-curriculum/blob/master/level_4/example_turtle_programs/clone_structure_program.lua).

----

That same instructor comes to our weekend sessions straight from [a course he's taking on quantum computing](https://www.qubitbyqubit.org/programs). 🤯

> In collaboration with IBM Quantum, we're offering the first ever year-long quantum course for 5,000 high school students and above. Complete with weekly lectures and labs led by TAs, students will be introduced to the field of quantum, including quantum mechanics, quantum computation, and quantum algorithms. Through the course, students will even run a program on a real quantum computer.
