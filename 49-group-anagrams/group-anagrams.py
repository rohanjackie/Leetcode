class Solution:
    from collections import defaultdict
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        anagram_map = defaultdict(list)
        result = []

        for s in strs:
            key = tuple(sorted(s))
            anagram_map[key].append(s)

        for e in anagram_map.values():
            result.append(e)

        return result


