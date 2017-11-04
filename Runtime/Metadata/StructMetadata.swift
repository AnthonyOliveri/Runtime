//
//  StructMetadata.swift
//  Runtime
//
//  Created by Wes Wickwire on 11/1/17.
//  Copyright © 2017 Wes Wickwire. All rights reserved.
//

import Foundation


struct StructMetadata: NominalMetadataType {
    
    var type: Any.Type
    var metadata: UnsafeMutablePointer<StructMetadataLayout>
    var nominalTypeDescriptor: UnsafeMutablePointer<NominalTypeDescriptor>
    var base: UnsafeMutablePointer<Int>
    
    init(type: Any.Type) {
        self.type = type
        base = metadataPointer(type: type)
        metadata = base.advanced(by: -1).raw.assumingMemoryBound(to: StructMetadataLayout.self)
        nominalTypeDescriptor = metadata.pointee.nominalTypeDescriptor.advanced()
    }
}
