# 🧩 Topic: RAG

## 1. The "Why"
* **Input Dependency:** RAG connects to an external data store that users do not need to provide or even be aware of to interact successfully with the system.
* **Limited Capacity:** RAG retrieves only the text most relevant to the prompt, creating smaller augmented prompts that fit within LLM context limits.
* **Redundancy Issues:** RAG ensures only the most pertinent information is passed to the LLM, making it easier for the system to identify relevant details in source texts.
* **Processing Time:** Shorter augmented prompts in RAG reduce the response generation time compared to non-RAG systems that include all available source information within the augmented prompt.
* **Cost Implications:** By using shorter augmented prompts, RAG reduces response generation costs, especially for systems with extensive data sources.

## 2. Arquitectura Visual 
![Diagrama de Flujo](./assets/images/RAG Process.png)
1. **Gather Sources:** Start with sources like office documents, company policies, or any other relevant information that may provide context for the user's future prompt.
2. **Embed Sources:** Pass the gathered information through an embedding model. The embedding model converts each chunk of text into a vector representation, which is essentially a fixed-length column of numbers.
3. **Store Vectors:** Store the embedded source vectors in a vector store — a specialized database optimized for storing and manipulating vector data.
4. **Obtain a User's Prompt:** Receive a prompt from the user.
5. **Embed the User's Prompt:** Embed the user's prompt using the same embedding model used for the source documents. This produces a prompt embedding, which is a vector of numbers equal in length to the vectors representing the source embeddings.
6. **Retrieve Relevant Data:** Pass the prompt embedding to the retriever. The retriever also accesses the vector store to find and pull relevant source embeddings (vectors) that match the prompt embedding. The retriever's output is the retrieved text.
7. **Create an Augmented Prompt:** Combine the retrieved text with the user's original prompt to form an augmented prompt.
8. **Obtain a Response:** Feed the augmented prompt into a large language model (LLM), which processes it and produces a response.

## 3. Implementación Técnica
* Simple systems use matrices, but most utilize specialized vector databases like ChromaDB, FAISS, or Milvus. Each database offers unique features and limitations.
* The user's prompt is embedded using the same embedding model as the source documents, ensuring compatibility.
