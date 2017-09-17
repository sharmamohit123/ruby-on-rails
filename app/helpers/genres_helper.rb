module GenresHelper

    def isGenre?(genre, subgenre)
       subgenre.genreId == genre.id 
    end
end
