function encode(p,q)
    k= copy(q)
    n = size(k)[begin]
    c = zeros(Int64,length(p))
    for i in 1:length(p)
        f = getf(k)
        c[i] = f[p[i]]
        f = circshift(f,p[i])
        for j in 1:n
            k[j,:] = circshift(k[j,:],f[j] )
        end       
    end
    c
end
function demoencode(p,q,F)
    k= copy(q)
    n = size(k)[begin]
    c = zeros(Int64,length(p))
    for i in 1:length(p)
        f = getf(k)
        c[i] = f[p[i]]
        f = circshift(f,p[i])
        push!(F,f)
        for j in 1:n
            k[j,:] = circshift(k[j,:],f[j] )
        end       
    end
    c
end

function inverse(f)
    g = zeros(Int64, length(f))
    for i in 1:length(f)
        g[i] = findfirst(isequal(i),f)
    end
    g
end

function decode(c,q)
    k= copy(q)
    n = size(k)[begin]
    p = zeros(Int64,length(c))
    for i in 1:length(c)
        f = getf(k)
        g = inverse(f)
        p[i] = g[c[i]]
        f = circshift(f,p[i])
        for j in 1:n
            k[j,:] = circshift(k[j,:],f[j] )
        end
    end
    p
end
