import { Snippet } from 'https://deno.land/x/tsnip_vim@v0.5/mod.ts';

const usestate: Snippet = {
  name: 'Snippet of React useState',
  params: [
    {
      name: 'name',
      type: 'single_line',
    },
    {
      name: 'default_value',
      type: 'single_line',
    },
    {
      name: 'type',
      type: 'single_line',
    }
  ],
  render: ({ name, default_value, type }) =>
    `const [${name?.text ?? ''}, set${
      name != null
        ? `${name.text?.charAt(0).toUpperCase()}${name.text?.slice(1)}`
        : ''
    }] = useState${type != null && type.text !== '' ? `<${type.text}>` : ''}(${default_value?.text ?? ''});`,
};

export default {
  usestate,
};
