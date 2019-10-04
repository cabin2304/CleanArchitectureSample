//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct CreatePostInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, author: String, title: String, content: Optional<String?> = nil, url: Optional<String?> = nil, publishers: Optional<[PublisherInput?]?> = nil, images: Optional<[S3ObjectInput?]?> = nil, ups: Optional<Int?> = nil, downs: Optional<Int?> = nil, version: Int) {
    graphQLMap = ["id": id, "author": author, "title": title, "content": content, "url": url, "publishers": publishers, "images": images, "ups": ups, "downs": downs, "version": version]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var author: String {
    get {
      return graphQLMap["author"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "author")
    }
  }

  public var title: String {
    get {
      return graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var content: Optional<String?> {
    get {
      return graphQLMap["content"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }

  public var url: Optional<String?> {
    get {
      return graphQLMap["url"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "url")
    }
  }

  public var publishers: Optional<[PublisherInput?]?> {
    get {
      return graphQLMap["publishers"] as! Optional<[PublisherInput?]?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "publishers")
    }
  }

  public var images: Optional<[S3ObjectInput?]?> {
    get {
      return graphQLMap["images"] as! Optional<[S3ObjectInput?]?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "images")
    }
  }

  public var ups: Optional<Int?> {
    get {
      return graphQLMap["ups"] as! Optional<Int?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ups")
    }
  }

  public var downs: Optional<Int?> {
    get {
      return graphQLMap["downs"] as! Optional<Int?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "downs")
    }
  }

  public var version: Int {
    get {
      return graphQLMap["version"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "version")
    }
  }
}

public struct PublisherInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(name: String, year: String) {
    graphQLMap = ["name": name, "year": year]
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var year: String {
    get {
      return graphQLMap["year"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "year")
    }
  }
}

public struct S3ObjectInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(bucket: String, key: String, region: String, localUri: String, mimeType: String) {
    graphQLMap = ["bucket": bucket, "key": key, "region": region, "localUri": localUri, "mimeType": mimeType]
  }

  public var bucket: String {
    get {
      return graphQLMap["bucket"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bucket")
    }
  }

  public var key: String {
    get {
      return graphQLMap["key"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "key")
    }
  }

  public var region: String {
    get {
      return graphQLMap["region"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "region")
    }
  }

  public var localUri: String {
    get {
      return graphQLMap["localUri"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "localUri")
    }
  }

  public var mimeType: String {
    get {
      return graphQLMap["mimeType"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "mimeType")
    }
  }
}

public struct UpdatePostInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, author: Optional<String?> = nil, title: Optional<String?> = nil, content: Optional<String?> = nil, url: Optional<String?> = nil, ups: Optional<Int?> = nil, downs: Optional<Int?> = nil, version: Optional<Int?> = nil) {
    graphQLMap = ["id": id, "author": author, "title": title, "content": content, "url": url, "ups": ups, "downs": downs, "version": version]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var author: Optional<String?> {
    get {
      return graphQLMap["author"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "author")
    }
  }

  public var title: Optional<String?> {
    get {
      return graphQLMap["title"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var content: Optional<String?> {
    get {
      return graphQLMap["content"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }

  public var url: Optional<String?> {
    get {
      return graphQLMap["url"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "url")
    }
  }

  public var ups: Optional<Int?> {
    get {
      return graphQLMap["ups"] as! Optional<Int?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ups")
    }
  }

  public var downs: Optional<Int?> {
    get {
      return graphQLMap["downs"] as! Optional<Int?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "downs")
    }
  }

  public var version: Optional<Int?> {
    get {
      return graphQLMap["version"] as! Optional<Int?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "version")
    }
  }
}

public struct DeletePostInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct CreateContactInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: Int, title: String, content: String, price: Optional<Int?> = nil, rating: Optional<Double?> = nil) {
    graphQLMap = ["id": id, "title": title, "content": content, "price": price, "rating": rating]
  }

  public var id: Int {
    get {
      return graphQLMap["id"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var title: String {
    get {
      return graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var content: String {
    get {
      return graphQLMap["content"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }

  public var price: Optional<Int?> {
    get {
      return graphQLMap["price"] as! Optional<Int?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "price")
    }
  }

  public var rating: Optional<Double?> {
    get {
      return graphQLMap["rating"] as! Optional<Double?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "rating")
    }
  }
}

public final class GetPostQuery: GraphQLQuery {
  public static let operationString =
    "query GetPost($id: ID!) {\n  getPost(id: $id) {\n    __typename\n    ...PostBrief\n  }\n}"

  public static var requestString: String { return operationString.appending(PostBrief.fragmentString).appending(S3Object.fragmentString).appending(Publisher.fragmentString) }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getPost", arguments: ["id": GraphQLVariable("id")], type: .object(GetPost.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getPost: GetPost? = nil) {
      self.init(snapshot: ["__typename": "Query", "getPost": getPost.flatMap { $0.snapshot }])
    }

    public var getPost: GetPost? {
      get {
        return (snapshot["getPost"] as? Snapshot).flatMap { GetPost(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getPost")
      }
    }

    public struct GetPost: GraphQLSelectionSet {
      public static let possibleTypes = ["Post"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("author", type: .nonNull(.scalar(String.self))),
        GraphQLField("content", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("images", type: .list(.object(Image.selections))),
        GraphQLField("publishers", type: .list(.object(Publisher.selections))),
        GraphQLField("state", type: .scalar(Int.self)),
        GraphQLField("lastTime", type: .scalar(Int.self)),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, title: String? = nil, author: String, content: String? = nil, url: String? = nil, images: [Image?]? = nil, publishers: [Publisher?]? = nil, state: Int? = nil, lastTime: Int? = nil, version: Int) {
        self.init(snapshot: ["__typename": "Post", "id": id, "title": title, "author": author, "content": content, "url": url, "images": images.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "publishers": publishers.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "state": state, "lastTime": lastTime, "version": version])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var author: String {
        get {
          return snapshot["author"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "author")
        }
      }

      public var content: String? {
        get {
          return snapshot["content"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var images: [Image?]? {
        get {
          return (snapshot["images"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Image(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "images")
        }
      }

      public var publishers: [Publisher?]? {
        get {
          return (snapshot["publishers"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Publisher(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "publishers")
        }
      }

      public var state: Int? {
        get {
          return snapshot["state"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      public var lastTime: Int? {
        get {
          return snapshot["lastTime"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "lastTime")
        }
      }

      public var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var postBrief: PostBrief {
          get {
            return PostBrief(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes = ["S3Object"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("bucket", type: .nonNull(.scalar(String.self))),
          GraphQLField("key", type: .nonNull(.scalar(String.self))),
          GraphQLField("region", type: .nonNull(.scalar(String.self))),
          GraphQLField("localUri", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(bucket: String, key: String, region: String, localUri: String? = nil) {
          self.init(snapshot: ["__typename": "S3Object", "bucket": bucket, "key": key, "region": region, "localUri": localUri])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var bucket: String {
          get {
            return snapshot["bucket"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "bucket")
          }
        }

        public var key: String {
          get {
            return snapshot["key"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "key")
          }
        }

        public var region: String {
          get {
            return snapshot["region"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "region")
          }
        }

        public var localUri: String? {
          get {
            return snapshot["localUri"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "localUri")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var s3Object: S3Object {
            get {
              return S3Object(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      public struct Publisher: GraphQLSelectionSet {
        public static let possibleTypes = ["Publisher"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("year", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(name: String, year: String) {
          self.init(snapshot: ["__typename": "Publisher", "name": name, "year": year])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var year: String {
          get {
            return snapshot["year"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "year")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var publisher: Publisher {
            get {
              return Publisher(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public final class AllPostsQuery: GraphQLQuery {
  public static let operationString =
    "query AllPosts($limit: Int, $nextToken: String) {\n  listPosts(limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      ...PostBrief\n      ups\n      downs\n    }\n    nextToken\n  }\n}"

  public static var requestString: String { return operationString.appending(PostBrief.fragmentString).appending(S3Object.fragmentString).appending(Publisher.fragmentString) }

  public var limit: Int?
  public var nextToken: String?

  public init(limit: Int? = nil, nextToken: String? = nil) {
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listPosts", arguments: ["limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListPost.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listPosts: ListPost? = nil) {
      self.init(snapshot: ["__typename": "Query", "listPosts": listPosts.flatMap { $0.snapshot }])
    }

    public var listPosts: ListPost? {
      get {
        return (snapshot["listPosts"] as? Snapshot).flatMap { ListPost(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listPosts")
      }
    }

    public struct ListPost: GraphQLSelectionSet {
      public static let possibleTypes = ["PostConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "PostConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Post"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("author", type: .nonNull(.scalar(String.self))),
          GraphQLField("content", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("images", type: .list(.object(Image.selections))),
          GraphQLField("publishers", type: .list(.object(Publisher.selections))),
          GraphQLField("state", type: .scalar(Int.self)),
          GraphQLField("lastTime", type: .scalar(Int.self)),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("ups", type: .scalar(Int.self)),
          GraphQLField("downs", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, title: String? = nil, author: String, content: String? = nil, url: String? = nil, images: [Image?]? = nil, publishers: [Publisher?]? = nil, state: Int? = nil, lastTime: Int? = nil, version: Int, ups: Int? = nil, downs: Int? = nil) {
          self.init(snapshot: ["__typename": "Post", "id": id, "title": title, "author": author, "content": content, "url": url, "images": images.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "publishers": publishers.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "state": state, "lastTime": lastTime, "version": version, "ups": ups, "downs": downs])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String? {
          get {
            return snapshot["title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var author: String {
          get {
            return snapshot["author"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "author")
          }
        }

        public var content: String? {
          get {
            return snapshot["content"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "content")
          }
        }

        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        public var images: [Image?]? {
          get {
            return (snapshot["images"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Image(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "images")
          }
        }

        public var publishers: [Publisher?]? {
          get {
            return (snapshot["publishers"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Publisher(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "publishers")
          }
        }

        public var state: Int? {
          get {
            return snapshot["state"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var lastTime: Int? {
          get {
            return snapshot["lastTime"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "lastTime")
          }
        }

        public var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        public var ups: Int? {
          get {
            return snapshot["ups"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "ups")
          }
        }

        public var downs: Int? {
          get {
            return snapshot["downs"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "downs")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var postBrief: PostBrief {
            get {
              return PostBrief(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Image: GraphQLSelectionSet {
          public static let possibleTypes = ["S3Object"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("bucket", type: .nonNull(.scalar(String.self))),
            GraphQLField("key", type: .nonNull(.scalar(String.self))),
            GraphQLField("region", type: .nonNull(.scalar(String.self))),
            GraphQLField("localUri", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(bucket: String, key: String, region: String, localUri: String? = nil) {
            self.init(snapshot: ["__typename": "S3Object", "bucket": bucket, "key": key, "region": region, "localUri": localUri])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var bucket: String {
            get {
              return snapshot["bucket"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "bucket")
            }
          }

          public var key: String {
            get {
              return snapshot["key"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "key")
            }
          }

          public var region: String {
            get {
              return snapshot["region"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "region")
            }
          }

          public var localUri: String? {
            get {
              return snapshot["localUri"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "localUri")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var s3Object: S3Object {
              get {
                return S3Object(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        public struct Publisher: GraphQLSelectionSet {
          public static let possibleTypes = ["Publisher"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("year", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(name: String, year: String) {
            self.init(snapshot: ["__typename": "Publisher", "name": name, "year": year])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var year: String {
            get {
              return snapshot["year"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "year")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var publisher: Publisher {
              get {
                return Publisher(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public final class MissingPostsQuery: GraphQLQuery {
  public static let operationString =
    "query MissingPosts($time: Float) {\n  listMissingPosts(time: $time) {\n    __typename\n    items {\n      __typename\n      ...PostBrief\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(PostBrief.fragmentString).appending(S3Object.fragmentString).appending(Publisher.fragmentString) }

  public var time: Double?

  public init(time: Double? = nil) {
    self.time = time
  }

  public var variables: GraphQLMap? {
    return ["time": time]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listMissingPosts", arguments: ["time": GraphQLVariable("time")], type: .object(ListMissingPost.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listMissingPosts: ListMissingPost? = nil) {
      self.init(snapshot: ["__typename": "Query", "listMissingPosts": listMissingPosts.flatMap { $0.snapshot }])
    }

    public var listMissingPosts: ListMissingPost? {
      get {
        return (snapshot["listMissingPosts"] as? Snapshot).flatMap { ListMissingPost(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listMissingPosts")
      }
    }

    public struct ListMissingPost: GraphQLSelectionSet {
      public static let possibleTypes = ["PostConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil) {
        self.init(snapshot: ["__typename": "PostConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Post"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("author", type: .nonNull(.scalar(String.self))),
          GraphQLField("content", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("images", type: .list(.object(Image.selections))),
          GraphQLField("publishers", type: .list(.object(Publisher.selections))),
          GraphQLField("state", type: .scalar(Int.self)),
          GraphQLField("lastTime", type: .scalar(Int.self)),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, title: String? = nil, author: String, content: String? = nil, url: String? = nil, images: [Image?]? = nil, publishers: [Publisher?]? = nil, state: Int? = nil, lastTime: Int? = nil, version: Int) {
          self.init(snapshot: ["__typename": "Post", "id": id, "title": title, "author": author, "content": content, "url": url, "images": images.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "publishers": publishers.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "state": state, "lastTime": lastTime, "version": version])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String? {
          get {
            return snapshot["title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var author: String {
          get {
            return snapshot["author"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "author")
          }
        }

        public var content: String? {
          get {
            return snapshot["content"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "content")
          }
        }

        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        public var images: [Image?]? {
          get {
            return (snapshot["images"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Image(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "images")
          }
        }

        public var publishers: [Publisher?]? {
          get {
            return (snapshot["publishers"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Publisher(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "publishers")
          }
        }

        public var state: Int? {
          get {
            return snapshot["state"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var lastTime: Int? {
          get {
            return snapshot["lastTime"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "lastTime")
          }
        }

        public var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var postBrief: PostBrief {
            get {
              return PostBrief(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Image: GraphQLSelectionSet {
          public static let possibleTypes = ["S3Object"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("bucket", type: .nonNull(.scalar(String.self))),
            GraphQLField("key", type: .nonNull(.scalar(String.self))),
            GraphQLField("region", type: .nonNull(.scalar(String.self))),
            GraphQLField("localUri", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(bucket: String, key: String, region: String, localUri: String? = nil) {
            self.init(snapshot: ["__typename": "S3Object", "bucket": bucket, "key": key, "region": region, "localUri": localUri])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var bucket: String {
            get {
              return snapshot["bucket"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "bucket")
            }
          }

          public var key: String {
            get {
              return snapshot["key"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "key")
            }
          }

          public var region: String {
            get {
              return snapshot["region"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "region")
            }
          }

          public var localUri: String? {
            get {
              return snapshot["localUri"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "localUri")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var s3Object: S3Object {
              get {
                return S3Object(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        public struct Publisher: GraphQLSelectionSet {
          public static let possibleTypes = ["Publisher"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("year", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(name: String, year: String) {
            self.init(snapshot: ["__typename": "Publisher", "name": name, "year": year])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var year: String {
            get {
              return snapshot["year"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "year")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var publisher: Publisher {
              get {
                return Publisher(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public final class AddPostMutation: GraphQLMutation {
  public static let operationString =
    "mutation AddPost($input: CreatePostInput!, $images: [S3ObjectInput]) {\n  createPost(input: $input, images: $images) {\n    __typename\n    ...PostBrief\n  }\n}"

  public static var requestString: String { return operationString.appending(PostBrief.fragmentString).appending(S3Object.fragmentString).appending(Publisher.fragmentString) }

  public var input: CreatePostInput
  public var images: [S3ObjectInput?]?

  public init(input: CreatePostInput, images: [S3ObjectInput?]? = nil) {
    self.input = input
    self.images = images
  }

  public var variables: GraphQLMap? {
    return ["input": input, "images": images]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createPost", arguments: ["input": GraphQLVariable("input"), "images": GraphQLVariable("images")], type: .object(CreatePost.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createPost: CreatePost? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createPost": createPost.flatMap { $0.snapshot }])
    }

    public var createPost: CreatePost? {
      get {
        return (snapshot["createPost"] as? Snapshot).flatMap { CreatePost(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createPost")
      }
    }

    public struct CreatePost: GraphQLSelectionSet {
      public static let possibleTypes = ["Post"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("author", type: .nonNull(.scalar(String.self))),
        GraphQLField("content", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("images", type: .list(.object(Image.selections))),
        GraphQLField("publishers", type: .list(.object(Publisher.selections))),
        GraphQLField("state", type: .scalar(Int.self)),
        GraphQLField("lastTime", type: .scalar(Int.self)),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, title: String? = nil, author: String, content: String? = nil, url: String? = nil, images: [Image?]? = nil, publishers: [Publisher?]? = nil, state: Int? = nil, lastTime: Int? = nil, version: Int) {
        self.init(snapshot: ["__typename": "Post", "id": id, "title": title, "author": author, "content": content, "url": url, "images": images.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "publishers": publishers.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "state": state, "lastTime": lastTime, "version": version])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var author: String {
        get {
          return snapshot["author"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "author")
        }
      }

      public var content: String? {
        get {
          return snapshot["content"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var images: [Image?]? {
        get {
          return (snapshot["images"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Image(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "images")
        }
      }

      public var publishers: [Publisher?]? {
        get {
          return (snapshot["publishers"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Publisher(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "publishers")
        }
      }

      public var state: Int? {
        get {
          return snapshot["state"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      public var lastTime: Int? {
        get {
          return snapshot["lastTime"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "lastTime")
        }
      }

      public var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var postBrief: PostBrief {
          get {
            return PostBrief(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes = ["S3Object"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("bucket", type: .nonNull(.scalar(String.self))),
          GraphQLField("key", type: .nonNull(.scalar(String.self))),
          GraphQLField("region", type: .nonNull(.scalar(String.self))),
          GraphQLField("localUri", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(bucket: String, key: String, region: String, localUri: String? = nil) {
          self.init(snapshot: ["__typename": "S3Object", "bucket": bucket, "key": key, "region": region, "localUri": localUri])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var bucket: String {
          get {
            return snapshot["bucket"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "bucket")
          }
        }

        public var key: String {
          get {
            return snapshot["key"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "key")
          }
        }

        public var region: String {
          get {
            return snapshot["region"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "region")
          }
        }

        public var localUri: String? {
          get {
            return snapshot["localUri"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "localUri")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var s3Object: S3Object {
            get {
              return S3Object(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      public struct Publisher: GraphQLSelectionSet {
        public static let possibleTypes = ["Publisher"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("year", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(name: String, year: String) {
          self.init(snapshot: ["__typename": "Publisher", "name": name, "year": year])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var year: String {
          get {
            return snapshot["year"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "year")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var publisher: Publisher {
            get {
              return Publisher(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public final class UpdatePostMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdatePost($input: UpdatePostInput!, $images: [S3ObjectInput]) {\n  updatePost(input: $input, images: $images) {\n    __typename\n    ...PostBrief\n  }\n}"

  public static var requestString: String { return operationString.appending(PostBrief.fragmentString).appending(S3Object.fragmentString).appending(Publisher.fragmentString) }

  public var input: UpdatePostInput
  public var images: [S3ObjectInput?]?

  public init(input: UpdatePostInput, images: [S3ObjectInput?]? = nil) {
    self.input = input
    self.images = images
  }

  public var variables: GraphQLMap? {
    return ["input": input, "images": images]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updatePost", arguments: ["input": GraphQLVariable("input"), "images": GraphQLVariable("images")], type: .object(UpdatePost.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updatePost: UpdatePost? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updatePost": updatePost.flatMap { $0.snapshot }])
    }

    public var updatePost: UpdatePost? {
      get {
        return (snapshot["updatePost"] as? Snapshot).flatMap { UpdatePost(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updatePost")
      }
    }

    public struct UpdatePost: GraphQLSelectionSet {
      public static let possibleTypes = ["Post"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("author", type: .nonNull(.scalar(String.self))),
        GraphQLField("content", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("images", type: .list(.object(Image.selections))),
        GraphQLField("publishers", type: .list(.object(Publisher.selections))),
        GraphQLField("state", type: .scalar(Int.self)),
        GraphQLField("lastTime", type: .scalar(Int.self)),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, title: String? = nil, author: String, content: String? = nil, url: String? = nil, images: [Image?]? = nil, publishers: [Publisher?]? = nil, state: Int? = nil, lastTime: Int? = nil, version: Int) {
        self.init(snapshot: ["__typename": "Post", "id": id, "title": title, "author": author, "content": content, "url": url, "images": images.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "publishers": publishers.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "state": state, "lastTime": lastTime, "version": version])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var author: String {
        get {
          return snapshot["author"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "author")
        }
      }

      public var content: String? {
        get {
          return snapshot["content"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var images: [Image?]? {
        get {
          return (snapshot["images"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Image(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "images")
        }
      }

      public var publishers: [Publisher?]? {
        get {
          return (snapshot["publishers"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Publisher(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "publishers")
        }
      }

      public var state: Int? {
        get {
          return snapshot["state"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      public var lastTime: Int? {
        get {
          return snapshot["lastTime"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "lastTime")
        }
      }

      public var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var postBrief: PostBrief {
          get {
            return PostBrief(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes = ["S3Object"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("bucket", type: .nonNull(.scalar(String.self))),
          GraphQLField("key", type: .nonNull(.scalar(String.self))),
          GraphQLField("region", type: .nonNull(.scalar(String.self))),
          GraphQLField("localUri", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(bucket: String, key: String, region: String, localUri: String? = nil) {
          self.init(snapshot: ["__typename": "S3Object", "bucket": bucket, "key": key, "region": region, "localUri": localUri])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var bucket: String {
          get {
            return snapshot["bucket"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "bucket")
          }
        }

        public var key: String {
          get {
            return snapshot["key"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "key")
          }
        }

        public var region: String {
          get {
            return snapshot["region"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "region")
          }
        }

        public var localUri: String? {
          get {
            return snapshot["localUri"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "localUri")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var s3Object: S3Object {
            get {
              return S3Object(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      public struct Publisher: GraphQLSelectionSet {
        public static let possibleTypes = ["Publisher"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("year", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(name: String, year: String) {
          self.init(snapshot: ["__typename": "Publisher", "name": name, "year": year])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var year: String {
          get {
            return snapshot["year"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "year")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var publisher: Publisher {
            get {
              return Publisher(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public final class DeletePostMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeletePost($input: DeletePostInput!) {\n  deletePost(input: $input) {\n    __typename\n    ...PostBrief\n  }\n}"

  public static var requestString: String { return operationString.appending(PostBrief.fragmentString).appending(S3Object.fragmentString).appending(Publisher.fragmentString) }

  public var input: DeletePostInput

  public init(input: DeletePostInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deletePost", arguments: ["input": GraphQLVariable("input")], type: .object(DeletePost.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deletePost: DeletePost? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deletePost": deletePost.flatMap { $0.snapshot }])
    }

    public var deletePost: DeletePost? {
      get {
        return (snapshot["deletePost"] as? Snapshot).flatMap { DeletePost(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deletePost")
      }
    }

    public struct DeletePost: GraphQLSelectionSet {
      public static let possibleTypes = ["Post"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("author", type: .nonNull(.scalar(String.self))),
        GraphQLField("content", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("images", type: .list(.object(Image.selections))),
        GraphQLField("publishers", type: .list(.object(Publisher.selections))),
        GraphQLField("state", type: .scalar(Int.self)),
        GraphQLField("lastTime", type: .scalar(Int.self)),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, title: String? = nil, author: String, content: String? = nil, url: String? = nil, images: [Image?]? = nil, publishers: [Publisher?]? = nil, state: Int? = nil, lastTime: Int? = nil, version: Int) {
        self.init(snapshot: ["__typename": "Post", "id": id, "title": title, "author": author, "content": content, "url": url, "images": images.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "publishers": publishers.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "state": state, "lastTime": lastTime, "version": version])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var author: String {
        get {
          return snapshot["author"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "author")
        }
      }

      public var content: String? {
        get {
          return snapshot["content"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var images: [Image?]? {
        get {
          return (snapshot["images"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Image(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "images")
        }
      }

      public var publishers: [Publisher?]? {
        get {
          return (snapshot["publishers"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Publisher(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "publishers")
        }
      }

      public var state: Int? {
        get {
          return snapshot["state"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      public var lastTime: Int? {
        get {
          return snapshot["lastTime"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "lastTime")
        }
      }

      public var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var postBrief: PostBrief {
          get {
            return PostBrief(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes = ["S3Object"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("bucket", type: .nonNull(.scalar(String.self))),
          GraphQLField("key", type: .nonNull(.scalar(String.self))),
          GraphQLField("region", type: .nonNull(.scalar(String.self))),
          GraphQLField("localUri", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(bucket: String, key: String, region: String, localUri: String? = nil) {
          self.init(snapshot: ["__typename": "S3Object", "bucket": bucket, "key": key, "region": region, "localUri": localUri])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var bucket: String {
          get {
            return snapshot["bucket"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "bucket")
          }
        }

        public var key: String {
          get {
            return snapshot["key"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "key")
          }
        }

        public var region: String {
          get {
            return snapshot["region"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "region")
          }
        }

        public var localUri: String? {
          get {
            return snapshot["localUri"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "localUri")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var s3Object: S3Object {
            get {
              return S3Object(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      public struct Publisher: GraphQLSelectionSet {
        public static let possibleTypes = ["Publisher"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("year", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(name: String, year: String) {
          self.init(snapshot: ["__typename": "Publisher", "name": name, "year": year])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var year: String {
          get {
            return snapshot["year"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "year")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var publisher: Publisher {
            get {
              return Publisher(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public final class CreateBatchMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateBatch($posts: [CreatePostInput]!) {\n  createBatch(posts: $posts) {\n    __typename\n    ...PostBrief\n  }\n}"

  public static var requestString: String { return operationString.appending(PostBrief.fragmentString).appending(S3Object.fragmentString).appending(Publisher.fragmentString) }

  public var posts: [CreatePostInput?]

  public init(posts: [CreatePostInput?]) {
    self.posts = posts
  }

  public var variables: GraphQLMap? {
    return ["posts": posts]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createBatch", arguments: ["posts": GraphQLVariable("posts")], type: .list(.object(CreateBatch.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createBatch: [CreateBatch?]? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createBatch": createBatch.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var createBatch: [CreateBatch?]? {
      get {
        return (snapshot["createBatch"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { CreateBatch(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "createBatch")
      }
    }

    public struct CreateBatch: GraphQLSelectionSet {
      public static let possibleTypes = ["Post"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("author", type: .nonNull(.scalar(String.self))),
        GraphQLField("content", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("images", type: .list(.object(Image.selections))),
        GraphQLField("publishers", type: .list(.object(Publisher.selections))),
        GraphQLField("state", type: .scalar(Int.self)),
        GraphQLField("lastTime", type: .scalar(Int.self)),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, title: String? = nil, author: String, content: String? = nil, url: String? = nil, images: [Image?]? = nil, publishers: [Publisher?]? = nil, state: Int? = nil, lastTime: Int? = nil, version: Int) {
        self.init(snapshot: ["__typename": "Post", "id": id, "title": title, "author": author, "content": content, "url": url, "images": images.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "publishers": publishers.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "state": state, "lastTime": lastTime, "version": version])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var author: String {
        get {
          return snapshot["author"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "author")
        }
      }

      public var content: String? {
        get {
          return snapshot["content"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var images: [Image?]? {
        get {
          return (snapshot["images"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Image(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "images")
        }
      }

      public var publishers: [Publisher?]? {
        get {
          return (snapshot["publishers"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Publisher(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "publishers")
        }
      }

      public var state: Int? {
        get {
          return snapshot["state"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      public var lastTime: Int? {
        get {
          return snapshot["lastTime"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "lastTime")
        }
      }

      public var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var postBrief: PostBrief {
          get {
            return PostBrief(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes = ["S3Object"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("bucket", type: .nonNull(.scalar(String.self))),
          GraphQLField("key", type: .nonNull(.scalar(String.self))),
          GraphQLField("region", type: .nonNull(.scalar(String.self))),
          GraphQLField("localUri", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(bucket: String, key: String, region: String, localUri: String? = nil) {
          self.init(snapshot: ["__typename": "S3Object", "bucket": bucket, "key": key, "region": region, "localUri": localUri])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var bucket: String {
          get {
            return snapshot["bucket"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "bucket")
          }
        }

        public var key: String {
          get {
            return snapshot["key"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "key")
          }
        }

        public var region: String {
          get {
            return snapshot["region"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "region")
          }
        }

        public var localUri: String? {
          get {
            return snapshot["localUri"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "localUri")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var s3Object: S3Object {
            get {
              return S3Object(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      public struct Publisher: GraphQLSelectionSet {
        public static let possibleTypes = ["Publisher"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("year", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(name: String, year: String) {
          self.init(snapshot: ["__typename": "Publisher", "name": name, "year": year])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var year: String {
          get {
            return snapshot["year"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "year")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var publisher: Publisher {
            get {
              return Publisher(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public final class CreateMultiMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateMulti($posts: [CreatePostInput], $contacts: [CreateContactInput]) {\n  createMulti(posts: $posts, contacts: $contacts) {\n    __typename\n    posts {\n      __typename\n      ...PostBrief\n    }\n    contacts {\n      __typename\n      title\n      content\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(PostBrief.fragmentString).appending(S3Object.fragmentString).appending(Publisher.fragmentString) }

  public var posts: [CreatePostInput?]?
  public var contacts: [CreateContactInput?]?

  public init(posts: [CreatePostInput?]? = nil, contacts: [CreateContactInput?]? = nil) {
    self.posts = posts
    self.contacts = contacts
  }

  public var variables: GraphQLMap? {
    return ["posts": posts, "contacts": contacts]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createMulti", arguments: ["posts": GraphQLVariable("posts"), "contacts": GraphQLVariable("contacts")], type: .object(CreateMulti.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createMulti: CreateMulti? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createMulti": createMulti.flatMap { $0.snapshot }])
    }

    public var createMulti: CreateMulti? {
      get {
        return (snapshot["createMulti"] as? Snapshot).flatMap { CreateMulti(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createMulti")
      }
    }

    public struct CreateMulti: GraphQLSelectionSet {
      public static let possibleTypes = ["MultiResults"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("posts", type: .list(.object(Post.selections))),
        GraphQLField("contacts", type: .list(.object(Contact.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(posts: [Post?]? = nil, contacts: [Contact?]? = nil) {
        self.init(snapshot: ["__typename": "MultiResults", "posts": posts.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "contacts": contacts.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var posts: [Post?]? {
        get {
          return (snapshot["posts"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Post(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "posts")
        }
      }

      public var contacts: [Contact?]? {
        get {
          return (snapshot["contacts"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Contact(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "contacts")
        }
      }

      public struct Post: GraphQLSelectionSet {
        public static let possibleTypes = ["Post"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("author", type: .nonNull(.scalar(String.self))),
          GraphQLField("content", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("images", type: .list(.object(Image.selections))),
          GraphQLField("publishers", type: .list(.object(Publisher.selections))),
          GraphQLField("state", type: .scalar(Int.self)),
          GraphQLField("lastTime", type: .scalar(Int.self)),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, title: String? = nil, author: String, content: String? = nil, url: String? = nil, images: [Image?]? = nil, publishers: [Publisher?]? = nil, state: Int? = nil, lastTime: Int? = nil, version: Int) {
          self.init(snapshot: ["__typename": "Post", "id": id, "title": title, "author": author, "content": content, "url": url, "images": images.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "publishers": publishers.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "state": state, "lastTime": lastTime, "version": version])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String? {
          get {
            return snapshot["title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var author: String {
          get {
            return snapshot["author"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "author")
          }
        }

        public var content: String? {
          get {
            return snapshot["content"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "content")
          }
        }

        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        public var images: [Image?]? {
          get {
            return (snapshot["images"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Image(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "images")
          }
        }

        public var publishers: [Publisher?]? {
          get {
            return (snapshot["publishers"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Publisher(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "publishers")
          }
        }

        public var state: Int? {
          get {
            return snapshot["state"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        public var lastTime: Int? {
          get {
            return snapshot["lastTime"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "lastTime")
          }
        }

        public var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var postBrief: PostBrief {
            get {
              return PostBrief(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Image: GraphQLSelectionSet {
          public static let possibleTypes = ["S3Object"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("bucket", type: .nonNull(.scalar(String.self))),
            GraphQLField("key", type: .nonNull(.scalar(String.self))),
            GraphQLField("region", type: .nonNull(.scalar(String.self))),
            GraphQLField("localUri", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(bucket: String, key: String, region: String, localUri: String? = nil) {
            self.init(snapshot: ["__typename": "S3Object", "bucket": bucket, "key": key, "region": region, "localUri": localUri])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var bucket: String {
            get {
              return snapshot["bucket"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "bucket")
            }
          }

          public var key: String {
            get {
              return snapshot["key"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "key")
            }
          }

          public var region: String {
            get {
              return snapshot["region"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "region")
            }
          }

          public var localUri: String? {
            get {
              return snapshot["localUri"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "localUri")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var s3Object: S3Object {
              get {
                return S3Object(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }

        public struct Publisher: GraphQLSelectionSet {
          public static let possibleTypes = ["Publisher"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("year", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(name: String, year: String) {
            self.init(snapshot: ["__typename": "Publisher", "name": name, "year": year])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var year: String {
            get {
              return snapshot["year"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "year")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var publisher: Publisher {
              get {
                return Publisher(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }

      public struct Contact: GraphQLSelectionSet {
        public static let possibleTypes = ["Contact"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(title: String, content: String) {
          self.init(snapshot: ["__typename": "Contact", "title": title, "content": content])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var title: String {
          get {
            return snapshot["title"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var content: String {
          get {
            return snapshot["content"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "content")
          }
        }
      }
    }
  }
}

public final class DeleteBatchMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteBatch($ids: [ID]!) {\n  deleteBatch(ids: $ids) {\n    __typename\n    id\n  }\n}"

  public var ids: [GraphQLID?]

  public init(ids: [GraphQLID?]) {
    self.ids = ids
  }

  public var variables: GraphQLMap? {
    return ["ids": ids]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteBatch", arguments: ["ids": GraphQLVariable("ids")], type: .list(.object(DeleteBatch.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteBatch: [DeleteBatch?]? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteBatch": deleteBatch.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var deleteBatch: [DeleteBatch?]? {
      get {
        return (snapshot["deleteBatch"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { DeleteBatch(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "deleteBatch")
      }
    }

    public struct DeleteBatch: GraphQLSelectionSet {
      public static let possibleTypes = ["Post"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID) {
        self.init(snapshot: ["__typename": "Post", "id": id])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class OnCreatePostSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreatePost {\n  onCreatePost {\n    __typename\n    ...PostBrief\n  }\n}"

  public static var requestString: String { return operationString.appending(PostBrief.fragmentString).appending(S3Object.fragmentString).appending(Publisher.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreatePost", type: .object(OnCreatePost.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreatePost: OnCreatePost? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreatePost": onCreatePost.flatMap { $0.snapshot }])
    }

    public var onCreatePost: OnCreatePost? {
      get {
        return (snapshot["onCreatePost"] as? Snapshot).flatMap { OnCreatePost(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreatePost")
      }
    }

    public struct OnCreatePost: GraphQLSelectionSet {
      public static let possibleTypes = ["Post"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("author", type: .nonNull(.scalar(String.self))),
        GraphQLField("content", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("images", type: .list(.object(Image.selections))),
        GraphQLField("publishers", type: .list(.object(Publisher.selections))),
        GraphQLField("state", type: .scalar(Int.self)),
        GraphQLField("lastTime", type: .scalar(Int.self)),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, title: String? = nil, author: String, content: String? = nil, url: String? = nil, images: [Image?]? = nil, publishers: [Publisher?]? = nil, state: Int? = nil, lastTime: Int? = nil, version: Int) {
        self.init(snapshot: ["__typename": "Post", "id": id, "title": title, "author": author, "content": content, "url": url, "images": images.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "publishers": publishers.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "state": state, "lastTime": lastTime, "version": version])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var author: String {
        get {
          return snapshot["author"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "author")
        }
      }

      public var content: String? {
        get {
          return snapshot["content"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var images: [Image?]? {
        get {
          return (snapshot["images"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Image(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "images")
        }
      }

      public var publishers: [Publisher?]? {
        get {
          return (snapshot["publishers"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Publisher(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "publishers")
        }
      }

      public var state: Int? {
        get {
          return snapshot["state"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      public var lastTime: Int? {
        get {
          return snapshot["lastTime"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "lastTime")
        }
      }

      public var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var postBrief: PostBrief {
          get {
            return PostBrief(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes = ["S3Object"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("bucket", type: .nonNull(.scalar(String.self))),
          GraphQLField("key", type: .nonNull(.scalar(String.self))),
          GraphQLField("region", type: .nonNull(.scalar(String.self))),
          GraphQLField("localUri", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(bucket: String, key: String, region: String, localUri: String? = nil) {
          self.init(snapshot: ["__typename": "S3Object", "bucket": bucket, "key": key, "region": region, "localUri": localUri])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var bucket: String {
          get {
            return snapshot["bucket"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "bucket")
          }
        }

        public var key: String {
          get {
            return snapshot["key"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "key")
          }
        }

        public var region: String {
          get {
            return snapshot["region"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "region")
          }
        }

        public var localUri: String? {
          get {
            return snapshot["localUri"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "localUri")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var s3Object: S3Object {
            get {
              return S3Object(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      public struct Publisher: GraphQLSelectionSet {
        public static let possibleTypes = ["Publisher"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("year", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(name: String, year: String) {
          self.init(snapshot: ["__typename": "Publisher", "name": name, "year": year])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var year: String {
          get {
            return snapshot["year"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "year")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var publisher: Publisher {
            get {
              return Publisher(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public final class OnUpdatePostSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdatePost {\n  onUpdatePost {\n    __typename\n    ...PostBrief\n  }\n}"

  public static var requestString: String { return operationString.appending(PostBrief.fragmentString).appending(S3Object.fragmentString).appending(Publisher.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdatePost", type: .object(OnUpdatePost.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdatePost: OnUpdatePost? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdatePost": onUpdatePost.flatMap { $0.snapshot }])
    }

    public var onUpdatePost: OnUpdatePost? {
      get {
        return (snapshot["onUpdatePost"] as? Snapshot).flatMap { OnUpdatePost(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdatePost")
      }
    }

    public struct OnUpdatePost: GraphQLSelectionSet {
      public static let possibleTypes = ["Post"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("author", type: .nonNull(.scalar(String.self))),
        GraphQLField("content", type: .scalar(String.self)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("images", type: .list(.object(Image.selections))),
        GraphQLField("publishers", type: .list(.object(Publisher.selections))),
        GraphQLField("state", type: .scalar(Int.self)),
        GraphQLField("lastTime", type: .scalar(Int.self)),
        GraphQLField("version", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, title: String? = nil, author: String, content: String? = nil, url: String? = nil, images: [Image?]? = nil, publishers: [Publisher?]? = nil, state: Int? = nil, lastTime: Int? = nil, version: Int) {
        self.init(snapshot: ["__typename": "Post", "id": id, "title": title, "author": author, "content": content, "url": url, "images": images.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "publishers": publishers.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "state": state, "lastTime": lastTime, "version": version])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var author: String {
        get {
          return snapshot["author"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "author")
        }
      }

      public var content: String? {
        get {
          return snapshot["content"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var images: [Image?]? {
        get {
          return (snapshot["images"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Image(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "images")
        }
      }

      public var publishers: [Publisher?]? {
        get {
          return (snapshot["publishers"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Publisher(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "publishers")
        }
      }

      public var state: Int? {
        get {
          return snapshot["state"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "state")
        }
      }

      public var lastTime: Int? {
        get {
          return snapshot["lastTime"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "lastTime")
        }
      }

      public var version: Int {
        get {
          return snapshot["version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "version")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var postBrief: PostBrief {
          get {
            return PostBrief(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes = ["S3Object"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("bucket", type: .nonNull(.scalar(String.self))),
          GraphQLField("key", type: .nonNull(.scalar(String.self))),
          GraphQLField("region", type: .nonNull(.scalar(String.self))),
          GraphQLField("localUri", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(bucket: String, key: String, region: String, localUri: String? = nil) {
          self.init(snapshot: ["__typename": "S3Object", "bucket": bucket, "key": key, "region": region, "localUri": localUri])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var bucket: String {
          get {
            return snapshot["bucket"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "bucket")
          }
        }

        public var key: String {
          get {
            return snapshot["key"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "key")
          }
        }

        public var region: String {
          get {
            return snapshot["region"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "region")
          }
        }

        public var localUri: String? {
          get {
            return snapshot["localUri"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "localUri")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var s3Object: S3Object {
            get {
              return S3Object(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      public struct Publisher: GraphQLSelectionSet {
        public static let possibleTypes = ["Publisher"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("year", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(name: String, year: String) {
          self.init(snapshot: ["__typename": "Publisher", "name": name, "year": year])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var year: String {
          get {
            return snapshot["year"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "year")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var publisher: Publisher {
            get {
              return Publisher(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public final class OnDeletePostSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeletePost {\n  onDeletePost {\n    __typename\n    id\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeletePost", type: .object(OnDeletePost.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeletePost: OnDeletePost? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeletePost": onDeletePost.flatMap { $0.snapshot }])
    }

    public var onDeletePost: OnDeletePost? {
      get {
        return (snapshot["onDeletePost"] as? Snapshot).flatMap { OnDeletePost(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeletePost")
      }
    }

    public struct OnDeletePost: GraphQLSelectionSet {
      public static let possibleTypes = ["Post"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID) {
        self.init(snapshot: ["__typename": "Post", "id": id])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public struct PostBrief: GraphQLFragment {
  public static let fragmentString =
    "fragment PostBrief on Post {\n  __typename\n  id\n  title\n  author\n  content\n  url\n  images {\n    __typename\n    ...S3Object\n  }\n  publishers {\n    __typename\n    ...Publisher\n  }\n  state\n  lastTime\n  version\n}"

  public static let possibleTypes = ["Post"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("title", type: .scalar(String.self)),
    GraphQLField("author", type: .nonNull(.scalar(String.self))),
    GraphQLField("content", type: .scalar(String.self)),
    GraphQLField("url", type: .scalar(String.self)),
    GraphQLField("images", type: .list(.object(Image.selections))),
    GraphQLField("publishers", type: .list(.object(Publisher.selections))),
    GraphQLField("state", type: .scalar(Int.self)),
    GraphQLField("lastTime", type: .scalar(Int.self)),
    GraphQLField("version", type: .nonNull(.scalar(Int.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, title: String? = nil, author: String, content: String? = nil, url: String? = nil, images: [Image?]? = nil, publishers: [Publisher?]? = nil, state: Int? = nil, lastTime: Int? = nil, version: Int) {
    self.init(snapshot: ["__typename": "Post", "id": id, "title": title, "author": author, "content": content, "url": url, "images": images.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "publishers": publishers.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "state": state, "lastTime": lastTime, "version": version])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var title: String? {
    get {
      return snapshot["title"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "title")
    }
  }

  public var author: String {
    get {
      return snapshot["author"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "author")
    }
  }

  public var content: String? {
    get {
      return snapshot["content"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "content")
    }
  }

  public var url: String? {
    get {
      return snapshot["url"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "url")
    }
  }

  public var images: [Image?]? {
    get {
      return (snapshot["images"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Image(snapshot: $0) } } }
    }
    set {
      snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "images")
    }
  }

  public var publishers: [Publisher?]? {
    get {
      return (snapshot["publishers"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Publisher(snapshot: $0) } } }
    }
    set {
      snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "publishers")
    }
  }

  public var state: Int? {
    get {
      return snapshot["state"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "state")
    }
  }

  public var lastTime: Int? {
    get {
      return snapshot["lastTime"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "lastTime")
    }
  }

  public var version: Int {
    get {
      return snapshot["version"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "version")
    }
  }

  public struct Image: GraphQLSelectionSet {
    public static let possibleTypes = ["S3Object"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("bucket", type: .nonNull(.scalar(String.self))),
      GraphQLField("key", type: .nonNull(.scalar(String.self))),
      GraphQLField("region", type: .nonNull(.scalar(String.self))),
      GraphQLField("localUri", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(bucket: String, key: String, region: String, localUri: String? = nil) {
      self.init(snapshot: ["__typename": "S3Object", "bucket": bucket, "key": key, "region": region, "localUri": localUri])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var bucket: String {
      get {
        return snapshot["bucket"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "bucket")
      }
    }

    public var key: String {
      get {
        return snapshot["key"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "key")
      }
    }

    public var region: String {
      get {
        return snapshot["region"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "region")
      }
    }

    public var localUri: String? {
      get {
        return snapshot["localUri"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "localUri")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var s3Object: S3Object {
        get {
          return S3Object(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }

  public struct Publisher: GraphQLSelectionSet {
    public static let possibleTypes = ["Publisher"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("year", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(name: String, year: String) {
      self.init(snapshot: ["__typename": "Publisher", "name": name, "year": year])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var year: String {
      get {
        return snapshot["year"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "year")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var publisher: Publisher {
        get {
          return Publisher(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }
}

public struct S3Object: GraphQLFragment {
  public static let fragmentString =
    "fragment S3Object on S3Object {\n  __typename\n  bucket\n  key\n  region\n  localUri\n}"

  public static let possibleTypes = ["S3Object"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("bucket", type: .nonNull(.scalar(String.self))),
    GraphQLField("key", type: .nonNull(.scalar(String.self))),
    GraphQLField("region", type: .nonNull(.scalar(String.self))),
    GraphQLField("localUri", type: .scalar(String.self)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(bucket: String, key: String, region: String, localUri: String? = nil) {
    self.init(snapshot: ["__typename": "S3Object", "bucket": bucket, "key": key, "region": region, "localUri": localUri])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var bucket: String {
    get {
      return snapshot["bucket"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "bucket")
    }
  }

  public var key: String {
    get {
      return snapshot["key"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "key")
    }
  }

  public var region: String {
    get {
      return snapshot["region"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "region")
    }
  }

  public var localUri: String? {
    get {
      return snapshot["localUri"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "localUri")
    }
  }
}

public struct Publisher: GraphQLFragment {
  public static let fragmentString =
    "fragment Publisher on Publisher {\n  __typename\n  name\n  year\n}"

  public static let possibleTypes = ["Publisher"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("year", type: .nonNull(.scalar(String.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(name: String, year: String) {
    self.init(snapshot: ["__typename": "Publisher", "name": name, "year": year])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var name: String {
    get {
      return snapshot["name"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "name")
    }
  }

  public var year: String {
    get {
      return snapshot["year"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "year")
    }
  }
}



extension S3Object: AWSS3ObjectProtocol {
  public func getBucketName() -> String {
      return bucket
  }

  public func getKeyName() -> String {
      return key
  }

  public func getRegion() -> String {
      return region
  }
}

extension S3ObjectInput: AWSS3ObjectProtocol, AWSS3InputObjectProtocol {
  public func getLocalSourceFileURL() -> URL? {
      return URL(string: self.localUri)
  }

  public func getMimeType() -> String {
      return self.mimeType
  }

  public func getBucketName() -> String {
      return self.bucket
  }

  public func getKeyName() -> String {
      return self.key
  }

  public func getRegion() -> String {
      return self.region
  }

}

//import AWSS3
//extension AWSS3PreSignedURLBuilder: AWSS3ObjectPresignedURLGenerator  {
//  public func getPresignedURL(s3Object: AWSS3ObjectProtocol) -> URL? {
//      let request = AWSS3GetPreSignedURLRequest()
//      request.bucket = s3Object.getBucketName()
//      request.key = s3Object.getKeyName()
//      var url : URL?
//      self.getPreSignedURL(request).continueWith { (task) -> Any? in
//          url = task.result as URL?
//          }.waitUntilFinished()
//      return url
//  }
//}

//extension AWSS3TransferUtility: AWSS3ObjectManager {
//
//  public func download(s3Object: AWSS3ObjectProtocol, toURL: URL, completion: @escaping ((Bool, Error?) -> Void)) {
//
//      let completionBlock: AWSS3TransferUtilityDownloadCompletionHandlerBlock = { task, url, data, error  -> Void in
//          if let _ = error {
//              completion(false, error)
//          } else {
//              completion(true, nil)
//          }
//      }
//      let _ = self.download(to: toURL, bucket: s3Object.getBucketName(), key: s3Object.getKeyName(), expression: nil, completionHandler: completionBlock)
//  }
//
//  public func upload(s3Object: AWSS3ObjectProtocol & AWSS3InputObjectProtocol, completion: @escaping ((_ success: Bool, _ error: Error?) -> Void)) {
//      let completionBlock : AWSS3TransferUtilityUploadCompletionHandlerBlock = { task, error  -> Void in
//          if let _ = error {
//              completion(false, error)
//          } else {
//              completion(true, nil)
//          }
//      }
//      let _ = self.uploadFile(s3Object.getLocalSourceFileURL()!, bucket: s3Object.getBucketName(), key: s3Object.getKeyName(), contentType: s3Object.getMimeType(), expression: nil, completionHandler: completionBlock).continueWith { (task) -> Any? in
//          if let err = task.error {
//              completion(false, err)
//          }
//          return nil
//      }
//  }
//}
