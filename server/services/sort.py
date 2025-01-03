from typing import List
from sentence_transformers import SentenceTransformer
import numpy as np


class SortSourceService:
    def __init__(self):
        self.embedding_model = SentenceTransformer("all-miniLM-L6-v2")

    def sort_sources(self, query: str, results: List[dict]):
        try:
            relevant = []
            q_embedding = self.embedding_model.encode(query)

            for result in results:
                res_embedding = self.embedding_model.encode(result["content"])

                similarity = float(
                    np.dot(q_embedding, res_embedding)
                    / (np.linalg.norm(q_embedding) * np.linalg.norm(res_embedding))
                )

                result["relevance_score"] = similarity

                if similarity > 0.3:
                    relevant.append(result)

            return sorted(
                relevant, key=lambda x: x["relevance_score"], reverse=True
            )
        except Exception as e:
            print(e)