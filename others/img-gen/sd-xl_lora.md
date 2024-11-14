Can use automatic1111 or kohya_ss for the UI

Locally or runpod for compute

## Using kohya_ss

1. Create an image dataset - 10-15 minimum pictures recommended, no backgrounds, each with same res

    1. Categorize photos according to the concepts and make subfolders

2. Utls -> Captioning -> BLIP Captioning and edit captions

    1. When editing captions manually, add objects that you want to model separately (to change later maybe), e.g. brown hair - so that model doesn't learn brown hair as the part of the face.

3. Create regularization of folder. Giving instance and class promtps for understanding. (in khoya - creates img, log, model dirs)

4. Use img, log, model(output model) in the fields or `Copy info to respective fields`

5. Params: 

    1. Choos ethe base model (preferrably sdxl-base/flux)

    2. Model name

    3. Precision to fp16

    4. Set Epoch (10 maybe) andb Save every N epochs

    5. For simplicity, set Training rate, TE learning rate, Unet learning rate to 0.004 each

    6. Network rank to 92-256 for face

    7. Activate No half VAE

    8. Max res to 1024,1024

    9. Adafactor optimizer with constant LR Scheduler should be fine

    10. Gradient checkpointing and Shuffle caption\

    11. Optimizer extra args: `scale_parameter=False relative_step=False warmup_init=False`