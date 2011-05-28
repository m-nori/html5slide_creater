!slide biglogo
!slide
# テスト

テスト  
aaa  
bbb

## h2

aaaaa

!slide
### aaa

* 1
  * 1.1
  * 1.2
  {: class="build" }
* 2
* 3
* 4
{: class="build" }

!slide smaller
### aaa

~~~~~~
File.open(input, 'r:utf-8').each do |line|
  if /^\!slide\s?(.*)$/ =~ line
    slides << slide if slide
    slide = {}
    slide[:class] = $1
    slide[:text] = ""
    next
  end
  slide[:text] << line
end
~~~~~~

---

!slide
1. aaa
   1. bbb
   2. ccc
2. ddd

!slide
|table| 1 | 2  |
|:---:|:-:|:--:|
|table| 1 | 2  |
|table| 1 | 2  |

!slide
term
: test1
: test2

!slide
test1
{: class="red" }

# テスト1
{: class="yellow" }

!slide
### image

<image class="centered" style="height: 500px" src="images/example-graph.png"/>


