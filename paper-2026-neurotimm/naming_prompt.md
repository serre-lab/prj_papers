# Prompt: Help me name a new open-source library of human-aligned vision models

## Context

I am a computational neuroscientist at Brown University. My lab studies the alignment (and misalignment) between human vision and deep neural networks (DNNs). We have a major new project that needs a good name.

## The problem we're solving

Over the past decade, DNNs trained for image classification (e.g., on ImageNet) have become increasingly accurate — some now match or exceed human performance. However, my group has discovered that as these models have gotten more accurate, they have become *less* aligned with human vision. Specifically:

- They rely on completely different visual features than humans to recognize objects (e.g., background textures instead of object parts like faces or wheels).
- They are worse at predicting human behavioral responses and neural activity in visual cortex.
- They are more vulnerable to adversarial attacks that are imperceptible to humans.

This is a fundamental problem for both AI (robustness, interpretability, trustworthiness) and for neuroscience (these models are widely used as models of biological vision, but they're becoming worse models).

## Our solution: "Harmonization"

We developed a training method called the **"neural harmonizer"** (published at NeurIPS 2022) that co-trains DNNs on their standard task (image classification) *and* on human behavioral data — specifically, maps of where humans look to recognize objects, collected through a large-scale online game called **ClickMe** (think of it as crowd-sourced human attention/feature importance maps). When DNNs are "harmonized" with this human behavioral data, they:

- Achieve equal or better classification accuracy
- Rely on the same visual features as humans
- Better predict human behavioral responses
- Better predict neural activity in primate visual cortex (even though they were never trained on neural data — this is a generalization result)
- Are more robust to adversarial attacks

## The project that needs a name

We are building a large, open-source library of **harmonized pretrained vision models**. We are taking the entire **TIMM library** (PyTorch Image Models — the standard open-source zoo of ~1,000 pretrained vision models that nearly every vision researcher uses) and fine-tuning every single model with our neural harmonizer using human behavioral data from ClickMe 2.0. The result is a drop-in replacement for TIMM where every model has been aligned with human perception.

This will be released on HuggingFace/GitHub as a community resource.

## What the name should capture

The key conceptual points:

1. **It's a model zoo / library** — a large collection of pretrained models, not a single model.
2. **The models are aligned with human vision** — they see the world more like humans do.
3. **The alignment signal is behavioral/perceptual** — it comes from human psychophysics (where people look to recognize objects), NOT from neural recordings or brain imaging. This is important: the training data is behavioral, and the neural alignment is an emergent downstream benefit.
4. **It builds on TIMM** — the existing standard model zoo. Referencing this lineage could be useful but is not required.
5. **It's meant to be a new standard** — a better foundation for both AI applications and computational neuroscience.

## What the name should NOT do

- **Do NOT use "neuro" or "neural"** in the name — this is misleading because the training signal is behavioral (human attention/gaze patterns from ClickMe), not neural recordings. We do show downstream generalization to neural data, but calling it "neural" overpromises.
- Avoid being too generic or boring (e.g., "AlignedTIMM", "HumanTIMM").
- Avoid names already taken by prominent projects in the field: DreamSim, Brain-Score, Sapiens, Ecoset, THINGSvision, DINO, CLIP.

## Naming patterns in the field for inspiration

Good names in ML/neuro tend to be: short (1-2 syllables ideal), pronounceable, evocative of the core concept, and sometimes work as backronyms. Examples:

- **TIMM** = PyTorch Image Models (pragmatic acronym)
- **CLIP** = Contrastive Language-Image Pre-training
- **DINO** = self-DIstillation with NO labels
- **DreamSim** = evocative metaphor + function
- **gLocal** = portmanteau of global + local
- **RTify** = reaction time + "-ify" (verb-ifying)
- **Xplique** = French wordplay on "explain"
- **CRAFT** = Concept Recursive Activation FacTorization
- **Ecoset** = ecological + dataset

## Additional context that might spark ideas

- **ClickMe** is the name of our human data collection game — participants highlight the features they use to recognize objects.
- The core metaphor is "teaching machines to see like humans" — humans are tutoring the models via their perceptual strategies.
- There's a nice analogy to optical instruments (lenses, prisms) that reveal or correct vision.
- The concept of "grounding" AI in human perception is central.
- The eye (iris, fovea, retina, pupil) vs. the brain — eye/perception metaphors are more accurate than brain/neural ones for our work.

## Naming inspiration from the language model alignment world

The concept of "aligning" AI with humans is much more developed in the language/LLM community, and their naming conventions are worth drawing from:

- **RLHF** = Reinforcement Learning from Human Feedback — the foundational method. Descriptive acronym.
- **DPO** = Direct Preference Optimization — cleaner, more direct alternative to RLHF. Technical but catchy.
- **Constitutional AI** (Anthropic) — evokes legal/governance frameworks; the idea that models follow a "constitution" of principles. Metaphorical.
- **InstructGPT** (OpenAI) — simple compound: what it does (follows instructions) + the base model. Functional.
- **Zephyr** (HuggingFace) — a gentle west wind from Greek mythology. Evocative, unexpected, memorable. No acronym — just a vibe.
- **Tülu** (Allen AI) — references linguistic/cultural diversity. Distinctive, short.
- **Llama**, **Mistral**, **Gemma**, **Phi** — the trend toward short, evocative, non-descriptive names (animals, weather, gems, Greek letters).

The parallel to our work: in LLMs, "alignment" means teaching models to behave according to human preferences and values. In our work, "alignment" means teaching vision models to *perceive* according to human visual strategies. Both involve incorporating human behavioral feedback into training. The LLM community has largely moved past purely descriptive names toward evocative ones — which may be the right instinct for us too.

## What I'm looking for

Please suggest 15-20 candidate names. For each, give:
1. The name
2. A one-line rationale
3. If it works as a backronym, what it could stand for
4. Any concerns (e.g., already taken, hard to pronounce, misleading)

Aim for a mix of: evocative single words, clever portmanteaus, clean acronyms, and anything unexpected. Prioritize memorability and accuracy over cleverness.
