module Halogen.HTML
  ( HTML()
  
  , text
  
  -- Elements
  
  , a           , a_
  , abbr          , abbr_
  , acronym       , acronym_
  , address       , address_
  , applet        , applet_
  , area          , area_
  , article       , article_
  , aside         , aside_
  , audio         , audio_
  , b             , b_
  , base          , base_
  , basefont      , basefont_
  , bdi           , bdi_
  , bdo           , bdo_
  , big           , big_
  , blockquote    , blockquote_
  , body          , body_
  , br            , br_
  , button        , button_
  , canvas        , canvas_
  , caption       , caption_
  , center        , center_
  , cite          , cite_
  , code          , code_
  , col           , col_
  , colgroup      , colgroup_
  , datalist      , datalist_
  , dd            , dd_
  , del           , del_
  , details       , details_
  , dfn           , dfn_
  , dialog        , dialog_
  , dir           , dir_
  , div           , div_
  , dl            , dl_
  , dt            , dt_
  , em            , em_
  , embed         , embed_
  , fieldset      , fieldset_
  , figcaption    , figcaption_
  , figure        , figure_
  , font          , font_
  , footer        , footer_
  , form          , form_
  , frame         , frame_
  , frameset      , frameset_
  , h1            , h1_
  , h2            , h2_
  , h3            , h3_
  , h4            , h4_
  , h5            , h5_
  , h6            , h6_
  , head          , head_
  , header        , header_
  , hr            , hr_
  , html          , html_
  , i             , i_
  , iframe        , iframe_
  , img           , img_
  , input         , input_
  , ins           , ins_
  , kbd           , kbd_
  , keygen        , keygen_
  , label         , label_
  , legend        , legend_
  , li            , li_
  , link          , link_
  , main          , main_
  , map           , map_
  , mark          , mark_
  , menu          , menu_
  , menuitem      , menuitem_
  , meta          , meta_
  , meter         , meter_
  , nav           , nav_
  , noframes      , noframes_
  , noscript      , noscript_
  , object        , object_
  , ol            , ol_
  , optgroup      , optgroup_
  , option        , option_
  , output        , output_
  , p             , p_
  , param         , param_
  , pre           , pre_
  , progress      , progress_
  , q             , q_
  , rp            , rp_
  , rt            , rt_
  , ruby          , ruby_
  , s             , s_
  , samp          , samp_
  , script        , script_
  , section       , section_
  , select        , select_
  , small         , small_
  , source        , source_
  , span          , span_
  , strike        , strike_
  , strong        , strong_
  , style         , style_
  , sub           , sub_
  , summary       , summary_
  , sup           , sup_
  , table         , table_
  , tbody         , tbody_
  , td            , td_
  , textarea      , textarea_
  , tfoot         , tfoot_
  , th            , th_
  , thead         , thead_
  , time          , time_
  , title         , title_
  , tr            , tr_
  , track         , track_
  , tt            , tt_
  , u             , u_
  , ul            , ul_
  , var           , var_
  , video         , video_
  , wbr           , wbr_
  
  , renderHtml
  ) where

import Control.Monad.Eff
import Control.Monad.ST

import Halogen.VirtualDOM
import qualified Halogen.HTML.Attributes as A

-- | The `HTML` type represents HTML documents before being rendered to the virtual DOM, and ultimately,
-- | the actual DOM.
-- |
-- | This representation is useful because it supports various typed transformations. It also gives a 
-- | strongly-typed representation for the events which can be generated by a document.
-- |
-- | The type parameter `i` represents the type of events which can be generated by this document.
data HTML i
  = Text String
  | Element String [A.Attribute i] [HTML i]
    
instance functorHTML :: Functor HTML where
  (<$>) _ (Text s) = Text s
  (<$>) f (Element name attribs children) = Element name (Data.Array.map (f <$>) attribs) (Data.Array.map (f <$>) children)

-- | Render a `HTML` document to a virtual DOM node
renderHtml :: forall i eff. (i -> Eff eff Unit) -> HTML i -> VTree
renderHtml _ (Text s) = vtext s
renderHtml k (Element name attribs children) = vnode name (A.attributesToProps k attribs) (Data.Array.map (renderHtml k) children)

text :: forall i. String -> HTML i
text = Text

-- | ## HTML Elements

a :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
a = Element "a"

a_ :: forall i. [HTML i] -> HTML i
a_ = a []

abbr :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
abbr = Element "abbr"

abbr_ :: forall i. [HTML i] -> HTML i
abbr_ = abbr []

acronym :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
acronym = Element "acronym"

acronym_ :: forall i. [HTML i] -> HTML i
acronym_ = acronym []

address :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
address = Element "address"

address_ :: forall i. [HTML i] -> HTML i
address_ = address []

applet :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
applet = Element "applet"

applet_ :: forall i. [HTML i] -> HTML i
applet_ = applet []

area :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
area = Element "area"

area_ :: forall i. [HTML i] -> HTML i
area_ = area []

article :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
article = Element "article"

article_ :: forall i. [HTML i] -> HTML i
article_ = article []

aside :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
aside = Element "aside"

aside_ :: forall i. [HTML i] -> HTML i
aside_ = aside []

audio :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
audio = Element "audio"

audio_ :: forall i. [HTML i] -> HTML i
audio_ = audio []

b :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
b = Element "b"

b_ :: forall i. [HTML i] -> HTML i
b_ = b []

base :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
base = Element "base"

base_ :: forall i. [HTML i] -> HTML i
base_ = base []

basefont :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
basefont = Element "basefont"

basefont_ :: forall i. [HTML i] -> HTML i
basefont_ = basefont []

bdi :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
bdi = Element "bdi"

bdi_ :: forall i. [HTML i] -> HTML i
bdi_ = bdi []

bdo :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
bdo = Element "bdo"

bdo_ :: forall i. [HTML i] -> HTML i
bdo_ = bdo []

big :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
big = Element "big"

big_ :: forall i. [HTML i] -> HTML i
big_ = big []

blockquote :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
blockquote = Element "blockquote"

blockquote_ :: forall i. [HTML i] -> HTML i
blockquote_ = blockquote []

body :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
body = Element "body"

body_ :: forall i. [HTML i] -> HTML i
body_ = body []

br :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
br = Element "br"

br_ :: forall i. [HTML i] -> HTML i
br_ = br []

button :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
button = Element "button"

button_ :: forall i. [HTML i] -> HTML i
button_ = button []

canvas :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
canvas = Element "canvas"

canvas_ :: forall i. [HTML i] -> HTML i
canvas_ = canvas []

caption :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
caption = Element "caption"

caption_ :: forall i. [HTML i] -> HTML i
caption_ = caption []

center :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
center = Element "center"

center_ :: forall i. [HTML i] -> HTML i
center_ = center []

cite :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
cite = Element "cite"

cite_ :: forall i. [HTML i] -> HTML i
cite_ = cite []

code :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
code = Element "code"

code_ :: forall i. [HTML i] -> HTML i
code_ = code []

col :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
col = Element "col"

col_ :: forall i. [HTML i] -> HTML i
col_ = col []

colgroup :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
colgroup = Element "colgroup"

colgroup_ :: forall i. [HTML i] -> HTML i
colgroup_ = colgroup []

datalist :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
datalist = Element "datalist"

datalist_ :: forall i. [HTML i] -> HTML i
datalist_ = datalist []

dd :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
dd = Element "dd"

dd_ :: forall i. [HTML i] -> HTML i
dd_ = dd []

del :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
del = Element "del"

del_ :: forall i. [HTML i] -> HTML i
del_ = del []

details :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
details = Element "details"

details_ :: forall i. [HTML i] -> HTML i
details_ = details []

dfn :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
dfn = Element "dfn"

dfn_ :: forall i. [HTML i] -> HTML i
dfn_ = dfn []

dialog :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
dialog = Element "dialog"

dialog_ :: forall i. [HTML i] -> HTML i
dialog_ = dialog []

dir :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
dir = Element "dir"

dir_ :: forall i. [HTML i] -> HTML i
dir_ = dir []

div :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
div = Element "div"

div_ :: forall i. [HTML i] -> HTML i
div_ = div []

dl :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
dl = Element "dl"

dl_ :: forall i. [HTML i] -> HTML i
dl_ = dl []

dt :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
dt = Element "dt"

dt_ :: forall i. [HTML i] -> HTML i
dt_ = dt []

em :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
em = Element "em"

em_ :: forall i. [HTML i] -> HTML i
em_ = em []

embed :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
embed = Element "embed"

embed_ :: forall i. [HTML i] -> HTML i
embed_ = embed []

fieldset :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
fieldset = Element "fieldset"

fieldset_ :: forall i. [HTML i] -> HTML i
fieldset_ = fieldset []

figcaption :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
figcaption = Element "figcaption"

figcaption_ :: forall i. [HTML i] -> HTML i
figcaption_ = figcaption []

figure :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
figure = Element "figure"

figure_ :: forall i. [HTML i] -> HTML i
figure_ = figure []

font :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
font = Element "font"

font_ :: forall i. [HTML i] -> HTML i
font_ = font []

footer :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
footer = Element "footer"

footer_ :: forall i. [HTML i] -> HTML i
footer_ = footer []

form :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
form = Element "form"

form_ :: forall i. [HTML i] -> HTML i
form_ = form []

frame :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
frame = Element "frame"

frame_ :: forall i. [HTML i] -> HTML i
frame_ = frame []

frameset :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
frameset = Element "frameset"

frameset_ :: forall i. [HTML i] -> HTML i
frameset_ = frameset []

h1 :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
h1 = Element "h1"

h1_ :: forall i. [HTML i] -> HTML i
h1_ = h1 []

h2 :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
h2 = Element "h2"

h2_ :: forall i. [HTML i] -> HTML i
h2_ = h2 []

h3 :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
h3 = Element "h3"

h3_ :: forall i. [HTML i] -> HTML i
h3_ = h3 []

h4 :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
h4 = Element "h4"

h4_ :: forall i. [HTML i] -> HTML i
h4_ = h4 []

h5 :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
h5 = Element "h5"

h5_ :: forall i. [HTML i] -> HTML i
h5_ = h5 []

h6 :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
h6 = Element "h6"

h6_ :: forall i. [HTML i] -> HTML i
h6_ = h6 []

head :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
head = Element "head"

head_ :: forall i. [HTML i] -> HTML i
head_ = head []

header :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
header = Element "header"

header_ :: forall i. [HTML i] -> HTML i
header_ = header []

hr :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
hr = Element "hr"

hr_ :: forall i. [HTML i] -> HTML i
hr_ = hr []

html :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
html = Element "html"

html_ :: forall i. [HTML i] -> HTML i
html_ = html []

i :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
i = Element "i"

i_ :: forall i. [HTML i] -> HTML i
i_ = i []

iframe :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
iframe = Element "iframe"

iframe_ :: forall i. [HTML i] -> HTML i
iframe_ = iframe []

img :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
img = Element "img"

img_ :: forall i. [HTML i] -> HTML i
img_ = img []

input :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
input = Element "input"

input_ :: forall i. [HTML i] -> HTML i
input_ = input []

ins :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
ins = Element "ins"

ins_ :: forall i. [HTML i] -> HTML i
ins_ = ins []

kbd :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
kbd = Element "kbd"

kbd_ :: forall i. [HTML i] -> HTML i
kbd_ = kbd []

keygen :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
keygen = Element "keygen"

keygen_ :: forall i. [HTML i] -> HTML i
keygen_ = keygen []

label :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
label = Element "label"

label_ :: forall i. [HTML i] -> HTML i
label_ = label []

legend :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
legend = Element "legend"

legend_ :: forall i. [HTML i] -> HTML i
legend_ = legend []

li :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
li = Element "li"

li_ :: forall i. [HTML i] -> HTML i
li_ = li []

link :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
link = Element "link"

link_ :: forall i. [HTML i] -> HTML i
link_ = link []

main :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
main = Element "main"

main_ :: forall i. [HTML i] -> HTML i
main_ = main []

map :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
map = Element "map"

map_ :: forall i. [HTML i] -> HTML i
map_ = map []

mark :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
mark = Element "mark"

mark_ :: forall i. [HTML i] -> HTML i
mark_ = mark []

menu :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
menu = Element "menu"

menu_ :: forall i. [HTML i] -> HTML i
menu_ = menu []

menuitem :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
menuitem = Element "menuitem"

menuitem_ :: forall i. [HTML i] -> HTML i
menuitem_ = menuitem []

meta :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
meta = Element "meta"

meta_ :: forall i. [HTML i] -> HTML i
meta_ = meta []

meter :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
meter = Element "meter"

meter_ :: forall i. [HTML i] -> HTML i
meter_ = meter []

nav :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
nav = Element "nav"

nav_ :: forall i. [HTML i] -> HTML i
nav_ = nav []

noframes :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
noframes = Element "noframes"

noframes_ :: forall i. [HTML i] -> HTML i
noframes_ = noframes []

noscript :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
noscript = Element "noscript"

noscript_ :: forall i. [HTML i] -> HTML i
noscript_ = noscript []

object :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
object = Element "object"

object_ :: forall i. [HTML i] -> HTML i
object_ = object []

ol :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
ol = Element "ol"

ol_ :: forall i. [HTML i] -> HTML i
ol_ = ol []

optgroup :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
optgroup = Element "optgroup"

optgroup_ :: forall i. [HTML i] -> HTML i
optgroup_ = optgroup []

option :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
option = Element "option"

option_ :: forall i. [HTML i] -> HTML i
option_ = option []

output :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
output = Element "output"

output_ :: forall i. [HTML i] -> HTML i
output_ = output []

p :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
p = Element "p"

p_ :: forall i. [HTML i] -> HTML i
p_ = p []

param :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
param = Element "param"

param_ :: forall i. [HTML i] -> HTML i
param_ = param []

pre :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
pre = Element "pre"

pre_ :: forall i. [HTML i] -> HTML i
pre_ = pre []

progress :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
progress = Element "progress"

progress_ :: forall i. [HTML i] -> HTML i
progress_ = progress []

q :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
q = Element "q"

q_ :: forall i. [HTML i] -> HTML i
q_ = q []

rp :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
rp = Element "rp"

rp_ :: forall i. [HTML i] -> HTML i
rp_ = rp []

rt :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
rt = Element "rt"

rt_ :: forall i. [HTML i] -> HTML i
rt_ = rt []

ruby :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
ruby = Element "ruby"

ruby_ :: forall i. [HTML i] -> HTML i
ruby_ = ruby []

s :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
s = Element "s"

s_ :: forall i. [HTML i] -> HTML i
s_ = s []

samp :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
samp = Element "samp"

samp_ :: forall i. [HTML i] -> HTML i
samp_ = samp []

script :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
script = Element "script"

script_ :: forall i. [HTML i] -> HTML i
script_ = script []

section :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
section = Element "section"

section_ :: forall i. [HTML i] -> HTML i
section_ = section []

select :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
select = Element "select"

select_ :: forall i. [HTML i] -> HTML i
select_ = select []

small :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
small = Element "small"

small_ :: forall i. [HTML i] -> HTML i
small_ = small []

source :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
source = Element "source"

source_ :: forall i. [HTML i] -> HTML i
source_ = source []

span :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
span = Element "span"

span_ :: forall i. [HTML i] -> HTML i
span_ = span []

strike :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
strike = Element "strike"

strike_ :: forall i. [HTML i] -> HTML i
strike_ = strike []

strong :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
strong = Element "strong"

strong_ :: forall i. [HTML i] -> HTML i
strong_ = strong []

style :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
style = Element "style"

style_ :: forall i. [HTML i] -> HTML i
style_ = style []

sub :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
sub = Element "sub"

sub_ :: forall i. [HTML i] -> HTML i
sub_ = sub []

summary :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
summary = Element "summary"

summary_ :: forall i. [HTML i] -> HTML i
summary_ = summary []

sup :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
sup = Element "sup"

sup_ :: forall i. [HTML i] -> HTML i
sup_ = sup []

table :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
table = Element "table"

table_ :: forall i. [HTML i] -> HTML i
table_ = table []

tbody :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
tbody = Element "tbody"

tbody_ :: forall i. [HTML i] -> HTML i
tbody_ = tbody []

td :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
td = Element "td"

td_ :: forall i. [HTML i] -> HTML i
td_ = td []

textarea :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
textarea = Element "textarea"

textarea_ :: forall i. [HTML i] -> HTML i
textarea_ = textarea []

tfoot :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
tfoot = Element "tfoot"

tfoot_ :: forall i. [HTML i] -> HTML i
tfoot_ = tfoot []

th :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
th = Element "th"

th_ :: forall i. [HTML i] -> HTML i
th_ = th []

thead :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
thead = Element "thead"

thead_ :: forall i. [HTML i] -> HTML i
thead_ = thead []

time :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
time = Element "time"

time_ :: forall i. [HTML i] -> HTML i
time_ = time []

title :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
title = Element "title"

title_ :: forall i. [HTML i] -> HTML i
title_ = title []

tr :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
tr = Element "tr"

tr_ :: forall i. [HTML i] -> HTML i
tr_ = tr []

track :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
track = Element "track"

track_ :: forall i. [HTML i] -> HTML i
track_ = track []

tt :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
tt = Element "tt"

tt_ :: forall i. [HTML i] -> HTML i
tt_ = tt []

u :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
u = Element "u"

u_ :: forall i. [HTML i] -> HTML i
u_ = u []

ul :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
ul = Element "ul"

ul_ :: forall i. [HTML i] -> HTML i
ul_ = ul []

var :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
var = Element "var"

var_ :: forall i. [HTML i] -> HTML i
var_ = var []

video :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
video = Element "video"

video_ :: forall i. [HTML i] -> HTML i
video_ = video []

wbr :: forall i. [A.Attribute i] -> [HTML i] -> HTML i
wbr = Element "wbr"

wbr_ :: forall i. [HTML i] -> HTML i
wbr_ = wbr []
