function encrypt(p, k, r)
    for i in 1:r
        K = spin(k,i)
        p = encode(p,K)
        p = reverse(p)
    end
    p
end

function decrypt(p, k, r)
    for i in 1:r
        K = spin(k,r + 1 - i)
        p = reverse(p)
        p = decode(p,K)
    end
    p
end

function demoencrypt(p, q, r, alph)
    F = Set()
    @printf "            "
    printvec(p,alph)
    for i in 1:r
        k = spin(q,i)
        p = demoencode(p,k,F)
        p = reverse(p)
        @printf "round %3d   " i
        printvec(p,alph)
    end
    @printf("\n[%5d/%5d]\n\n\n", length(F), r*length(p)) 
    p
end

function demodecrypt(c, q, r,alph)
    @printf "            "
    printvec(c,alph)
    for i in 1:r
        k = spin(q,r + 1 - i)
        c = reverse(c)
        c = decode(c,k)
        @printf "round %3d   " i
        printvec(c,alph)
    end
    c
end