###
----------------------------------------------------------------
每日古文
----------------------------------------------------------------
###

# Widget Settings 
# 读取文本文件中的内容
command:
    " sed -n \"$((RANDOM%573))p\" \"./daily-ancient-Chinese-prose/quotes.txt\" "

# 更新频率
refreshFrequency: "1d"

# 样式
style: """
  top: 5%
  left: 8%
  font-family: yuweif,Helvetica Neue,Helvetica
  font-size: 20px
  line-height: 1.5

  .container
    position: relative
    height: 100%
    padding: 10px
    border-radius: 10px
    background: rgba(255, 255, 255, .01)
    box-shadow: 0 0 1.25em rgba(0, 0, 0, .5)
    text-shadow: 0 0 0.625em rgba(0, 0, 0, .35)
    overflow: hidden
    -webkit-backdrop-filter: blur(10px)

  #author
        font-size 25px
        padding: 10px
        float: right
        font-style: italic
        color: yellow
        font-family: FZSuXinShiLiuKaiS-R-GB
    
  #qoute
        font-size 50px
        padding: 10px
        width: 800px
        color: white
        font-weight: bold

"""
# Initial render
render: (output) ->
    fields = output.split("--");
    quote = fields[0];
    author = if typeof(fields[1]) == "undefined" then "" else fields[1]
    """
    <div class='container'>
      <div id="qoute"> #{quote} </div>
      <div id="author"> #{author} </div>
    </div>
    """

# Update when refresh occurs
update: (output, domEl) ->
    fields = output.split("--");
    quote = fields[0];
    author = if typeof(fields[1]) == "undefined" then "" else fields[1]
    $(domEl).empty();
    $(domEl).append("""
    <div class='container'>
      <div id="qoute"> #{quote} </div>
      <div id="author"> #{author} </div>
    </div>
    """);