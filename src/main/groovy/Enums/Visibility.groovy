package Enums

enum Visibility {

        PRIVATE("private", 0L),
        PUBLIC("public", 1L)

        String name
        Long id

        Visibility(String name, Long id){
                this.name = name
                this.id = id
        }
}