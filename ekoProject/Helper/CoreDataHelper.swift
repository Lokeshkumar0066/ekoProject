//
//  CoreDataHelper.swift
//  CoreDataHelper
//

import Foundation
import CoreData

class CoreDataHelper {

    // Returns NSFetchRequest Object for the Model Class passed in parameter.
    // Invoke SharedAppDelegate.managedObjectContext.executeFetchRequest(request)
    // in order to get only the entries  in Database, which follows the Predicate passed as parameter
    class func getFetchRequestforModelClass(_ className : NSManagedObject.Type, predicate : NSPredicate? = nil) -> NSFetchRequest<NSFetchRequestResult> {

        let stringClassName = String(describing: className)
        //String(stringInterpolationSegment: className)
        let entityDescription = NSEntityDescription.entity(forEntityName: stringClassName, in: AppDelegate.instance.managedObjectContext)
        
        let request = NSFetchRequest<NSFetchRequestResult>()
        request.entity = entityDescription

        if let pred = predicate {
            request.predicate = pred
        }
        return request
    }

    // Returns NSBatchDeleteRequest in Object for the Model Class passed in parameter.
    // Invoke SharedAppDelegate.persistentStoreCoordinator.executeRequest(...)
    // in order to clear the Database
    class func getDeleteRequestforModelClass(_ className: NSManagedObject.Type) -> NSBatchDeleteRequest {
        let fetchRequest = self.getFetchRequestforModelClass(className)
        return NSBatchDeleteRequest(fetchRequest: fetchRequest)
    }
    
    @discardableResult
    class func deleteDataForClass<T: NSManagedObject>(_ className: T.Type) -> Bool {
        let deleteReq = CoreDataHelper.getDeleteRequestforModelClass(className)
        do {
            try AppDelegate.instance.managedObjectContext.execute(deleteReq)
            return true
        } catch {
            let fetchError = error as NSError
            print(fetchError)
            return false
        }
    }
    
    
    // Returns Object for the Model Class passed in parameter.
    // Assign values to the attributes for the object and
    // Invoke SharedAppDelegate.managedObjectContext.save()
    // in order to save the entry in Database
    class func getInstanceOfModelClass<T: NSManagedObject>(_ className: T.Type) -> T {
        let instance = className.init(context: AppDelegate.instance.managedObjectContext)
        return instance
    }

    class func getDataForClass<T: NSManagedObject>(_ className: T.Type, predicate : NSPredicate? = nil, sort: [NSSortDescriptor]? = nil) -> [T] {
        // let predicate = NSPredicate(format: "(YOUR_COLOM_NAME == %@)", VALUE_TO_CHECK)
        let fetchReq = CoreDataHelper.getFetchRequestforModelClass(className, predicate: predicate)
        fetchReq.sortDescriptors = sort

        do {
            let result = try AppDelegate.instance.managedObjectContext.fetch(fetchReq)
            return result as! [T]
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        return []
    }
}

