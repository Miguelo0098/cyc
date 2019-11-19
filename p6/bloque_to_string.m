function stringed = bloque_to_string(tama, oldbloque)

bloque_string = '';

for index = 1:length(oldbloque)
    string = int2str(oldbloque(index));
    if length(string) < tama
        for index2 = 1:(tama - length(string))
            string = ['0' string];
        end
    end
    bloque_string = [bloque_string string];
end

stringed = bloque_string;

end