# Expression	Name
# ~x	bitwise not
# x & y	bitwise and
# x | y	bitwise or
# x ⊻ y	bitwise xor (exclusive or)
# x >>> y	logical shift right
# x >> y	arithmetic shift right
# x << y	logical/arithmetic shift left



function r_0(p,q,r)
    return false
end

#
function r_1(p,q,r)
    return ~(p|q|r)
end
#
function r_2(p,q,r)
    return ~p & ~q & r
end
#
function r_3(p,q,r)
    return ~(p | q)
end
#
function r_4(p,q,r)
    return ~(p | r) & q
end
#
function r_5(p,q,r)
    return ~(p | r)
end
#

#

#

#

#

#

#

#

#

#

#
function r_254(p,q,r)
    return p | q | r
end
#
function r_255(p,q,r)
    return true
end
