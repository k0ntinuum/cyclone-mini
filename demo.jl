function vecfromstring(s,alph)
    n = length(s)
    v = zeros(Int64,n)
    for i in 1:n
        v[i] = findfirst(isequal(s[i]),alph)
    end
    v
end

function demo(n)
    k = randomkey(n)
    r = 5
    alph = alph_letters
    @printf "random key\n"
    printkey(k,alph_letters)
    #p = Random.randperm(n)
    p = vecfromstring("THIS_IS_THE_CYCLONE_SYMMETRIC_CRYPTO_SYSTEM_A_STACK_OF_WHEELS",alph)
    c = demoencrypt(p,k,r,alph)
    d = demodecrypt(c,k,r,alph)
    if p != d @printf "ERROR" end

end