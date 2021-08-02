package com.rxlogix

import grails.gorm.transactions.Transactional

@Transactional
class ResourcesService {

    def serviceMethod() {

    }

    def createDocument(def request,Map params, Resources r){
        def file = request.getFile('document')
        String path = ""
        if (file && !file.empty) {
            File photo = new File("/home/rxlogix/Desktop/TrainingFolders63/Project/grails-app/assets/images/profile/${r.id}.jpg")
            file.transferTo(photo)
            path = "/profile/${r.id}.jpg"
        }

        DocumentResource d = new DocumentResource(filePath: path, resource: r)
        try {
//              redirect back with success msg
            d.save(flush:true,failOnError:true)
            return "Document added Successfully..."
        }catch(Exception e) {
//              redirect back with error msg
            print(e)
            return "Error in adding document, Please try again..."
        }
    }
}
