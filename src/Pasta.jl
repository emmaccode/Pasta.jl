module Pasta
using Toolips
using ToolipsSession

function fade_up()
    fup = Animation("fade_up")
    fup[:from] = :transform => "translateY(100%)"
    fup[:from] = :opacity => "0%"
    fup[:to] = :opacity => "100%"
    fup[:to] = :transform => "translateY(0%)"
    fup
end

function leave()
    fup = Animation("nav_out")
    fup[:from] = :transform => "translateX(0px)"
    fup[:from] = :opacity => "100%"
    fup[:to] = :opacity => "0%"
    fup[:to] = :transform => "translateX(-400px)"
    fup
end

function stylesheet()
    bodys = Style("body")
    bodys["background-color"] = "#729CA2"
    buttons = Style("button", color = "#FFFFFF", border = "none", padding =
    "10px", cursor = "pointer")
    liststyle = Style("li", cursor = "pointer", color = "white")
    liststyle["background-color"] = "green"
    liststyle["font-size"] = "12pt"
    liststyle["padding"] = "4px"
    buttons["background-color"] = "#FF893B"
    buttons["font-size"] = "14pt"
    divs = Style("div", padding = "50px")
    animate!(divs, fade_up())
    divs["background-color"] = "#C4DCDF"
    font = link("Sofia", rel = "stylesheet",
        href = "https://fonts.googleapis.com/css2?family=Poppins&family=Roboto+Mono:wght@100&family=Rubik:wght@500&display=swap")
    as = Style("a", color = "#465461")
    as["font-family"] = "'Poppins', sans-serif"
    as["font-size"] = "20pt"
    components(bodys, liststyle, buttons, divs, font, as, fade_up())
end

function file_open(s::String, c::Connection)
    fileopen_div = divider("fileopen_div")
    if s != ""
        readstr = read("public/texts/" * s, String)
    else
        readstr = "new file"
        s = "newfile.jl"
    end
    namebox = a("filenamebox", text = s, contenteditable = true)
    textbox = a("textbox", contenteditable = true, text = readstr)
    save_btn = button("save_btn", text = "save text")
    close_btn = button("close_btn", text = "close file")
    close_btn["background-color"] = "red"
    on(c, save_btn, "click") do cm::ComponentModifier
        filet = cm[textbox][:text]
        write("public/texts/" * cm[namebox][:text], filet)
        alert!(cm, "pasta just saved your file, yo")
    end
    on(c, close_btn, "click") do cm::ComponentModifier
        remove!(cm, cm[fileopen_div])
    end
    push!(fileopen_div, namebox, br(), br(), save_btn, br(), close_btn,
     br(), textbox)
    components(fileopen_div)
end

function home(c::Connection)
    write!(c, stylesheet())
    headimage = img("logoimg", src = "'Spaghetti5.png'", align = "center",
    width = "150")
    file_opendiv = divider("file_opendiv", align = "center")
    style!(file_opendiv, "margin-top" => "125px", "margin-left" => "150px",
    "margin-right" => "150px", "border-style" => "solid",
    "border-width" => "5px", "border-color" => "lightblue")
    github_button = button("github_button", text = "This project on Github")
    toolips_button = button("tlbutton", text = "toolips")
    style!(toolips_button, "background-color" => "blue")
    github_a = a(href = "http://")
    push!(file_opendiv, br(), headimage, br(),
    a("helloworld", text = "welcome to Pasta.jl"), br(),
    github_button, br(), br(), toolips_button)
    open_button = button("openfile", text = "open")
    new_button = button("newfile", text = "new")
    push!(file_opendiv, br(), br(), open_button, new_button)
    lower_div = divider("lower_div", align = "center")
    style!(lower_div, "margin-left" => "150px",
    "margin-right" => "150px", "border-style" => "solid",
    "border-width" => "5px", "border-color" => "lightblue", "height" => "100px")
    available_files = divider("available_files")
    for file in readdir("public/texts")
         listoption = li("li$file", text = file)
         on(c, listoption, "click") do cm::ComponentModifier
             set_children!(cm, lower_div, file_open(file, c))
         end
         push!(available_files, listoption)
     end
    on(c, open_button, "click") do cm::ComponentModifier
        set_children!(cm, lower_div, components(available_files))
    end
    on(c, new_button, "click") do cm::ComponentModifier
        set_children!(cm, lower_div, file_open("", c))
    end
    style!(new_button, "background-color" => "green")
    write!(c, file_opendiv)
    write!(c, lower_div)
end


fourofour = route("404") do c
    write!(c, p("404message", text = "404, not found!"))
end

"""
start()
"""
function start(IP::String = "127.0.0.1", PORT::Integer = 8000,
    extensions::Any = [Logger(), Files(), Session()])
    rs = routes(route("/", home), fourofour)
    server = ServerTemplate(IP, PORT, rs, extensions = extensions)
    server.start()
end

end # - module
