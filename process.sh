MODEL_NAME="$1"

python merge_peft_adapters.py
mv merged_peft $MODEL_NAME
python ../llama.cpp/convert.py $MODEL_NAME/final_merged_checkpoint/ --outtype f32 --outfile ../$MODEL_NAME.full.gguf
python ../llama.cpp/convert.py $MODEL_NAME/final_merged_checkpoint/ --outtype q8_0 --outfile ../$MODEL_NAME.q8_0.gguf
# ../llama.cpp/quantize ../$MODEL_NAME.full.gguf ../$MODEL_NAME.q4_0.gguf q4_0
