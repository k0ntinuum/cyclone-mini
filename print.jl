alph_letters = "_ABCDEFGHIJKLMNOPQRSTUVWXYZ"
alph_numbers = "1234567890"
function printkey(k, alph)
    n = size(k)[begin]
    for r in 1:n
        for c in 1:n print(alph[k[r,c]], " ") end
        print("\n")
    end
    @printf "\n\n"
end

function printvec(v, alph)
    for i in 1:length(v)
        #@printf "%d " i
        print(alph[v[i]], " ")
    end
    @printf "\n"
end