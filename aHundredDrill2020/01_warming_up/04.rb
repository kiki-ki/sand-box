s = "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can."
tar = [1, 5, 6, 7, 8, 9, 15, 16, 19]
p s.delete(".").split.map.with_index{ |v, i| [tar.include?(i + 1) ? v[0] : v[0..1], i] }.to_h