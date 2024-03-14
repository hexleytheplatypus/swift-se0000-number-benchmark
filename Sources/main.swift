import CollectionsBenchmark
import SE0000_Number

///
/// Compile & Run: swift run -c release benchmark run results --cycles 15
/// Render PNG: swift run -c release benchmark render results chart.png
/// Render SVG: swift run -c release benchmark render results chart.svg
///

extension Benchmark {
    public mutating func addDictionaryBenchmarks() {
        self.add(
            title: "Dictionary<Int, Int> successful index(forKey:)",
            input: ([Int], [Int]).self
        ) { input, lookups in
            let d = Dictionary(uniqueKeysWithValues: input.lazy.map { ($0, 2 * $0) })
            return { timer in
                for i in lookups {
                    precondition(d.index(forKey: i) != nil)
                }
            }
        }
    }

    public mutating func addUInt32Benchmarks() {
        self.add(title: "UInt32.+", input: Int.self) { input in
            let lhs = identity(UInt32(input))
            let rhs = lhs
            return { timer in
                blackHole(lhs + rhs)
            }
        }

//        self.add(title: "UInt32.+=", input: Int.self) { input in
//            return { timer in
//                var lhs = identity(UInt32(input))
//                blackHole(lhs += identity(UInt32(input)))
//            }
//        }
//
//        self.add(title: "UInt32.-", input: Int.self) { input in
//            return { timer in
//                blackHole(identity(UInt32(input)) - identity(UInt32(input)))
//            }
//        }
//
//        self.add(title: "UInt32.*", input: Int.self) { input in
//            return { timer in
//                blackHole(identity(UInt32(input)) * identity(UInt32(input)))
//            }
//        }

        self.add(title: "UInt32./", input: Int.self) { input in
            return { timer in
                blackHole(identity(UInt32(input)) / identity(UInt32(input)))
            }
        }

        self.add(title: "UInt32.==", input: Int.self) { input in
            let lhs = identity(UInt32(input))
            let rhs = lhs
            return { timer in
                blackHole(lhs == rhs)
            }
        }
    }

    public mutating func addUInt64Benchmarks() {
        self.add(title: "UInt64.+", input: Int.self) { input in
            let lhs = identity(UInt64(input))
            let rhs = lhs
            return { timer in
                blackHole(lhs + rhs)
            }
        }

//        self.add(title: "UInt64.+=", input: Int.self) { input in
//            return { timer in
//                var lhs = identity(UInt64(input))
//                blackHole(lhs += identity(UInt64(input)))
//            }
//        }
//
//        self.add(title: "UInt64.-", input: Int.self) { input in
//            return { timer in
//                blackHole(identity(UInt64(input)) - identity(UInt64(input)))
//            }
//        }
//
//        self.add(title: "UInt64.*", input: Int.self) { input in
//            return { timer in
//                blackHole(identity(UInt64(input)) * identity(UInt64(input)))
//            }
//        }

        self.add(title: "UInt64./", input: Int.self) { input in
            return { timer in
                blackHole(identity(UInt64(input)) / identity(UInt64(input)))
            }
        }

        self.add(title: "UInt64.==", input: Int.self) { input in
            let lhs = identity(UInt64(input))
            let rhs = lhs
            return { timer in
                blackHole(lhs == rhs)
            }
        }
    }

    public mutating func addNumberBenchmarks() {
        self.add(title: "Number.+", input: Int.self) { input in
            let lhs = identity(Number(input))
            let rhs = lhs
            return { timer in
                blackHole(lhs + rhs)
            }
        }

//        self.add(title: "Number.+=", input: Int.self) { input in
//            return { timer in
//                var lhs = identity(Number(input))
//                blackHole(lhs += identity(Number(input)))
//            }
//        }
//
//        self.add(title: "Number.-", input: Int.self) { input in
//            return { timer in
//                blackHole(identity(Number(input)) - identity(Number(input)))
//            }
//        }
//
//        self.add(title: "Number.*", input: Int.self) { input in
//            return { timer in
//                blackHole(identity(Number(input)) * identity(Number(input)))
//            }
//        }

        self.add(title: "Number./", input: Int.self) { input in
            return { timer in
                blackHole(identity(Number(input)) / identity(Number(input)))
            }
        }

        self.add(title: "Number.==", input: Int.self) { input in
            let lhs = identity(Number(input))
            let rhs = lhs
            return { timer in
                blackHole(lhs == rhs)
            }
        }
    }
}

var benchmark = Benchmark(title: "Number Benchmarks")
//benchmark.addDictionaryBenchmarks()
benchmark.addUInt32Benchmarks()
//benchmark.addUInt64Benchmarks()
benchmark.addNumberBenchmarks()
benchmark.main()

