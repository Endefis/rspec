class ResistorColorDuo
        def self.value(colours)
                colour_codes = Hash["brown" =>1, "black"=>0, "red"=>2, "orange"=>3,
                                    "yellow"=>4,"green"=>5,"blue"=>6,"violet"=>7,
                                    "grey"=>8,"white"=>9]
                10*colour_codes[colours[0]]+colour_codes[colours[1]]
        end
end
