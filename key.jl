function randomkey(n)
    k = zeros(Int64, n, n)
    for i in 1:n
        k[i,:] = Random.randperm(n)
    end
    k
end

function getf(k)
    n = size(k)[begin]
    f = zeros(Int64,n)
    for i in 1:n
        x = i
        for j in 1:n     x = k[ j, x ]         end
        f[i] = x
    end
    f
end

function spin(k,r)
    q = copy(k)
    n = size(q)[begin]
    for i in 1:r
        f = getf(q)
        for j in 1:n
            q[j,:] = circshift(q[j,:],f[j] )
        end
    end
    q
end