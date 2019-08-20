package linksharing

import grails.transaction.Transactional

@Transactional
class SearchService {

    def showSearch(String searchKey)
    {
        String entry = searchKey
        if (entry==null)
            return null

        List<String> topicResults = Topic.createCriteria().list{
            ilike("name","%${entry}%")
        }.collect{it.name}

        List<String> resourceResults = Resource.createCriteria().list{
            ilike("description","%${entry}%")
        }.collect{it.description}

        List<String> resultSet = topicResults+resourceResults
        return resultSet
    }
    def showResult(String searchKey){
        String entry = searchKey
        if (entry==null)
            return null

        List<String> results = Resource.createCriteria().list{
            ilike("description","%${entry}%")
        }.collect{it.description}
        return results
    }
}
