#!/binT/python

b = 46065
c = 0
d = b >> 2
e = b >> 3
f = b >> 5
g = e | f
h = e & f
i = ~h
j = g & i
k = d | j
l = d & j
m = ~l
n = k & m
o = b | n
p = b & n
q = ~p
r = o & q
s = 1 & r
t = c << 1
u = t | s
v = b >> 1
w = s << 15
x = v | w
y = x >> 2
z = x >> 3
aa = x >> 5
ab = z | aa
ac = z & aa
ad = ~ac
ae = ab & ad
af = y | ae
ag = y & ae
ah = ~ag
ai = af & ah
aj = x | ai
ak = x & ai
al = ~ak
am = aj & al
an = 1 & am
ao = u << 1
ap = ao | an
aq = x >> 1
ar = an << 15
ask = aq | ar
at = ask >> 2
au = ask >> 3
av = ask >> 5
aw = au | av
ax = au & av
ay = ~ax
az = aw & ay
ba = at | az
bb = at & az
bc = ~bb
bd = ba & bc
be = ask | bd
bf = ask & bd
bg = ~bf
bh = be & bg
bi = 1 & bh
bj = ap << 1
bk = bj | bi
bl = ask >> 1
bm = bi << 15
bn = bl | bm
bo = bn >> 2
bp = bn >> 3
bq = bn >> 5
br = bp | bq
bs = bp & bq
bt = ~bs
bu = br & bt
bv = bo | bu
bw = bo & bu
bx = ~bw
by = bv & bx
bz = bn | by
ca = bn & by
cb = ~ca
cc = bz & cb
cd = 1 & cc
ce = bk << 1
cf = ce | cd
cg = bn >> 1
ch = cd << 15
ci = cg | ch
cj = ci >> 2
ck = ci >> 3
cl = ci >> 5
cm = ck | cl
cn = ck & cl
co = ~cn
cp = cm & co
cq = cj | cp
cr = cj & cp
cs = ~cr
ct = cq & cs
cu = ci | ct
cv = ci & ct
cw = ~cv
cx = cu & cw
cy = 1 & cx
cz = cf << 1
da = cz | cy
db = ci >> 1
dc = cy << 15
dd = db | dc
de = dd >> 2
df = dd >> 3
dg = dd >> 5
dh = df | dg
di = df & dg
dj = ~di
dk = dh & dj
dl = de | dk
dm = de & dk
dn = ~dm
do = dl & dn
dp = dd | do
dq = dd & do
dr = ~dq
ds = dp & dr
dt = 1 & ds
du = da << 1
dv = du | dt
dw = dd >> 1
dx = dt << 15
dy = dw | dx
dz = dy >> 2
ea = dy >> 3
eb = dy >> 5
ec = ea | eb
ed = ea & eb
ee = ~ed
ef = ec & ee
eg = dz | ef
eh = dz & ef
ei = ~eh
ej = eg & ei
ek = dy | ej
el = dy & ej
em = ~el
en = ek & em
eo = 1 & en
ep = dv << 1
eq = ep | eo
er = dy >> 1
es = eo << 15
et = er | es
eu = et >> 2
ev = et >> 3
ew = et >> 5
ex = ev | ew
ey = ev & ew
ez = ~ey
fa = ex & ez
fb = eu | fa
fc = eu & fa
fd = ~fc
fe = fb & fd
ff = et | fe
fg = et & fe
fh = ~fg
fi = ff & fh
fj = 1 & fi
fk = eq << 1
fl = fk | fj
fm = et >> 1
fn = fj << 15
fo = fm | fn
fp = fo >> 2
fq = fo >> 3
fr = fo >> 5
fs = fq | fr
ft = fq & fr
fu = ~ft
fv = fs & fu
fw = fp | fv
fx = fp & fv
fy = ~fx
fz = fw & fy
ga = fo | fz
gb = fo & fz
gc = ~gb
gd = ga & gc
ge = 1 & gd
gf = fl << 1
gg = gf | ge
gh = fo >> 1
gi = ge << 15
gj = gh | gi
gk = gj >> 2
gl = gj >> 3
gm = gj >> 5
gn = gl | gm
go = gl & gm
gp = ~go
gq = gn & gp
gr = gk | gq
gs = gk & gq
gt = ~gs
gu = gr & gt
gv = gj | gu
gw = gj & gu
gx = ~gw
gy = gv & gx
gz = 1 & gy
ha = gg << 1
hb = ha | gz
hc = gj >> 1
hd = gz << 15
he = hc | hd
hf = he >> 2
hg = he >> 3
hh = he >> 5
hi = hg | hh
hj = hg & hh
hk = ~hj
hl = hi & hk
hm = hf | hl
hn = hf & hl
ho = ~hn
hp = hm & ho
hq = he | hp
hr = he & hp
hs = ~hr
ht = hq & hs
hu = 1 & ht
hv = hb << 1
hw = hv | hu
hx = he >> 1
hy = hu << 15
hz = hx | hy
ia = hz >> 2
ib = hz >> 3
ic = hz >> 5
idT = ib | ic
ie = ib & ic
ifT = ~ie
ig = idT & ifT
ih = ia | ig
ii = ia & ig
ij = ~ii
ik = ih & ij
il = hz | ik
im = hz & ik
inT = ~im
io = il & inT
ip = 1 & io
iq = hw << 1
ir = iq | ip
isT = hz >> 1
it = ip << 15
iu = isT | it
iv = iu >> 2
iw = iu >> 3
ix = iu >> 5
iy = iw | ix
iz = iw & ix
ja = ~iz
jb = iy & ja
jc = iv | jb
jd = iv & jb
je = ~jd
jf = jc & je
jg = iu | jf
jh = iu & jf
ji = ~jh
jj = jg & ji
jk = 1 & jj
jl = ir << 1
jm = jl | jk
jn = iu >> 1
jo = jk << 15
jp = jn | jo
jq = jp >> 2
jr = jp >> 3
js = jp >> 5
jt = jr | js
ju = jr & js
jv = ~ju
jw = jt & jv
jx = jq | jw
jy = jq & jw
jz = ~jy
ka = jx & jz
kb = jp | ka
kc = jp & ka
kd = ~kc
ke = kb & kd
kf = 1 & ke
kg = jm << 1
kh = kg | kf
ki = jp >> 1
kj = kf << 15
kk = ki | kj
kl = kk >> 2
km = kk >> 3
kn = kk >> 5
ko = km | kn
kp = km & kn
kq = ~kp
kr = ko & kq
ks = kl | kr
kt = kl & kr
ku = ~kt
kv = ks & ku
kw = kk | kv
kx = kk & kv
ky = ~kx
kz = kw & ky
la = 1 & kz
lb = kh << 1
lc = lb | la
ld = kk >> 1
le = la << 15
lf = ld | le
lg = lf >> 2
lh = lf >> 3
li = lf >> 5
lj = lh | li
lk = lh & li
ll = ~lk
lm = lj & ll
ln = lg | lm
lo = lg & lm
lp = ~lo
lq = ln & lp
lr = lf | lq
ls = lf & lq
lt = ~ls
lu = lr & lt
lv = 1 & lu
lw = lc << 1
lx = lw | lv
ly = lf >> 1
lz = lv << 15
ma = ly | lz
a = lx
