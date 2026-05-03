import Foundation

enum GalleryCatalog {
    static var allNodes: [CatalogNode] {
        [referenceTree, swiftUITree, appKitTree]
    }

    static func leaf(forID id: CatalogNode.ID) -> Leaf? {
        for root in allNodes {
            if let found = findLeaf(in: root, id: id) { return found }
        }
        return nil
    }

    private static func findLeaf(in node: CatalogNode, id: CatalogNode.ID) -> Leaf? {
        if node.id == id, case .leaf(let l) = node { return l }
        if let children = node.children {
            for child in children {
                if let found = findLeaf(in: child, id: id) { return found }
            }
        }
        return nil
    }
}
